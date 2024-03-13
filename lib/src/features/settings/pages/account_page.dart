import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/features/settings/controllers/settings_controller.dart';
import 'package:chap_mobile/src/features/settings/widgets/gender_alert_bottom.dart';
import 'package:chap_mobile/src/features/settings/widgets/name_alert.dart';
import 'package:chap_mobile/src/features/settings/widgets/phone_number_alert.dart';
import 'package:chap_mobile/src/global/controllers/init_controller.dart';
import 'package:chap_mobile/src/global/providers/account_common_provider.dart';
import 'package:chap_mobile/src/global/providers/common_providers.dart';
import 'package:chap_mobile/src/models/user_response.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  DateFormat dateFormat = DateFormat();
  UserResponse user = UserResponse.empty();
  bool isLoading = false;

  _initUserCredentials() {
    ref.read(initControllerProvider).getUserAndToken().then((value) {
      final userInfo = ref.read(currentUserProvider);
      //final token = ref.read(authTokenProvider);

      ref
          .read(settingsControllerProvider)
          .userProfile(context: context, phoneNumber: userInfo!.phoneNumber!)
          .then((value) {
        setState(() {
          user = value;
          isLoading = false;
        });
      });
    });
  }

  _updateUserBirthday(Map<String, dynamic> map, String phoneNumber) {
    ref
        .read(settingsControllerProvider)
        .updatedUserProfile(phoneNumber: phoneNumber, updatedUserMap: map);
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('fr');
    setState(() {
      isLoading = false;
    });
    _initUserCredentials();
  }

  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.parse(user.createdAt!);
    var firstNameProvider = ref.watch(accountFirstNameProvider);
    var lastNameProvider = ref.watch(accountLastNameProvider);
    var emailProvider = ref.watch(accountEmailProvider);
    var genderProvider = ref.watch(accountGenderProvider);
    var birthdayProvider = ref.watch(accountBirthdayProvider);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: AppColor.backgroundColor,
        appBar: _buildAppBar(
            context, dateTime, firstNameProvider, lastNameProvider),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            tileColor: AppColor.backgroundWhiteColor,
                            leading: SvgPicture.asset(
                              IconAssets.phoneNumber,
                              color: AppColor.backgroundTextSecondaryColor,
                              width: 25,
                              height: 25,
                            ),
                            title: Text(AppStrings.accountPhoneNumber,
                                style: AppText.tileSetting),
                            subtitle: user.createdAt == ""
                                ? Container()
                                : Text("+228 ${user.phoneNumber}",
                                    style: AppText.appBarSubTitle),
                            trailing: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25))),
                                      builder: (context) =>
                                          PhoneNumberBottomSheet(
                                            user: user,
                                          ));
                                },
                                icon: const Icon(Icons.info_outline_rounded,
                                    color: AppColor.primaryColor, size: 25)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            tileColor: AppColor.backgroundWhiteColor,
                            leading: SvgPicture.asset(
                              IconAssets.earth,
                              color: AppColor.backgroundTextSecondaryColor,
                              width: 25,
                              height: 25,
                            ),
                            title: Text(AppStrings.accountCountry,
                                style: AppText.tileSetting),
                            subtitle:
                                Text("Togo", style: AppText.appBarSubTitle),
                            trailing: Image.asset(
                              ImageAssets.flag,
                              width: 40,
                              height: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            tileColor: AppColor.backgroundWhiteColor,
                            leading: const Icon(CupertinoIcons.person,
                                size: 25,
                                color: AppColor.backgroundTextSecondaryColor),
                            title: Text(AppStrings.accountFirstName,
                                style: AppText.tileSettingFilled),
                            subtitle: firstNameProvider.toString() != ""
                                ? Text(firstNameProvider.toString(),
                                    style: AppText.appBarSubTitleBold)
                                : Text(user.firstName!,
                                    style: AppText.appBarSubTitleBold),
                            trailing: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25))),
                                    builder: (context) => NameBottomSheet(
                                          name:
                                              firstNameProvider.toString() != ""
                                                  ? firstNameProvider.toString()
                                                  : user.firstName!,
                                          label: "Prénom*",
                                          phoneNumber: user.phoneNumber!,
                                        ));
                              },
                              icon: SvgPicture.asset(
                                IconAssets.edit,
                                color: AppColor.backgroundTextSecondaryColor,
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            tileColor: AppColor.backgroundWhiteColor,
                            leading: const Icon(CupertinoIcons.person,
                                size: 25,
                                color: AppColor.backgroundTextSecondaryColor),
                            title: Text(AppStrings.accountLastName,
                                style: AppText.tileSettingFilled),
                            subtitle: lastNameProvider.toString() != ""
                                ? Text(lastNameProvider.toString(),
                                    style: AppText.appBarSubTitleBold)
                                : Text(user.lastName!,
                                    style: AppText.appBarSubTitleBold),
                            trailing: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25))),
                                    builder: (context) => NameBottomSheet(
                                          name:
                                              lastNameProvider.toString() != ""
                                                  ? lastNameProvider.toString()
                                                  : user.lastName!,
                                          label: "Nom de famille",
                                          phoneNumber: user.phoneNumber!,
                                        ));
                              },
                              icon: SvgPicture.asset(
                                IconAssets.edit,
                                color: AppColor.backgroundTextSecondaryColor,
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            tileColor: AppColor.backgroundWhiteColor,
                            leading: SvgPicture.asset(
                              IconAssets.mail,
                              color: AppColor.backgroundTextSecondaryColor,
                              width: 25,
                              height: 25,
                            ),
                            title: Text(AppStrings.accountEmail,
                                style: AppText.tileSettingFilled),
                            subtitle: emailProvider.toString() != ""
                                ? Text(emailProvider,
                                    style: AppText.appBarSubTitleBold)
                                : Text(user.email == null ? "" : user.email!,
                                    style: AppText.appBarSubTitleBold),
                            trailing: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25))),
                                    builder: (context) => NameBottomSheet(
                                          name: user.email != null
                                              ? user.email!
                                              : "",
                                          label: "Email",
                                          phoneNumber: user.phoneNumber!,
                                        ));
                              },
                              icon: SvgPicture.asset(
                                IconAssets.edit,
                                color: AppColor.backgroundTextSecondaryColor,
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15)),
                              tileColor: AppColor.backgroundWhiteColor,
                              leading: const Icon(Icons.woman,
                                  size: 25,
                                  color: AppColor.backgroundTextSecondaryColor),
                              title: Text(AppStrings.accountGender,
                                  style: AppText.tileSettingFilled),
                              subtitle: genderProvider.toString() != ""
                                  ? Text(genderProvider.toString(),
                                      style: AppText.appBarSubTitleBold)
                                  : Text(user.sex!,
                                      style: AppText.appBarSubTitleBold),
                              trailing: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25))),
                                      builder: (context) => GenderBottomSheet(
                                          phoneNumber: user.phoneNumber!,
                                          gender:
                                              genderProvider.toString() != ""
                                                  ? genderProvider.toString()
                                                  : user.sex!));
                                },
                                icon: SvgPicture.asset(
                                  IconAssets.edit,
                                  color: AppColor.backgroundTextSecondaryColor,
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15)),
                              tileColor: AppColor.backgroundWhiteColor,
                              leading: SvgPicture.asset(
                                IconAssets.calendar,
                                color: AppColor.backgroundTextSecondaryColor,
                                width: 25,
                                height: 25,
                              ),
                              title: Text(AppStrings.accountBirthDay,
                                  style: AppText.tileSettingFilled),
                              subtitle: birthdayProvider.toString() != ""
                                  ? Text(
                                      dateFormat.format(DateTime.parse(
                                          birthdayProvider.toString())),
                                      style: AppText.appBarSubTitleBold)
                                  : Text(
                                      user.birthday == null ||
                                              user.birthday == "19700101"
                                          ? ""
                                          : dateFormat.format(
                                              DateTime.parse(user.birthday!)),
                                      style: AppText.appBarSubTitleBold),
                              trailing: IconButton(
                                onPressed: () async {
                                  DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1970),
                                      lastDate: DateTime(2040));

                                  if (newDate != null) {
                                    setState(() {
                                      dateTime = newDate;
                                    });
                                  }

                                  Map<String, dynamic> updatedUserMap = {
                                    'birthday': newDate!.toString()
                                  };

                                  _updateUserBirthday(
                                      updatedUserMap, user.phoneNumber!);

                                  ref
                                      .read(accountBirthdayProvider.notifier)
                                      .state = newDate.toString();
                                },
                                icon: SvgPicture.asset(
                                  IconAssets.edit,
                                  color: AppColor.backgroundTextSecondaryColor,
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ))
            ]),
          ),
        ));
  }

  _buildAppBar(BuildContext context, DateTime dateTime, String firstName,
      String lastName) {
    return AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.16),
            child: Stack(children: [
              Column(
                children: [
                  Container(
                    color: AppColor.primaryColor,
                    height: 55,
                  ),
                  Container(
                    color: AppColor.backgroundWhiteColor,
                    height: 75,
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CircleAvatar(
                      backgroundColor: AppColor.backgroundColor,
                      radius: 60,
                      child: CircleAvatar(
                        backgroundColor: AppColor.backgroundWhiteColor,
                        radius: 52,
                        child: SvgPicture.asset(
                          IconAssets.user,
                          color: AppColor.backgroundTextColor,
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                  ),
                  isLoading
                      ? Expanded(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(left: 25),
                                child: const SpinKitChasingDots(
                                    color: AppColor.primaryColor, size: 25)),
                          ],
                        ))
                      : Expanded(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin:
                                    const EdgeInsets.only(left: 15, top: 65),
                                child: Row(
                                  children: [
                                    firstName.toString() != ""
                                        ? Text("$firstName",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            maxLines: 2,
                                            style: AppText.account)
                                        : Text("${user.firstName}",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            maxLines: 2,
                                            style: AppText.account),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    lastName.toString() != ""
                                        ? Text("$lastName",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            maxLines: 2,
                                            style: AppText.account)
                                        : Text("${user.lastName}",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            maxLines: 2,
                                            style: AppText.account),
                                  ],
                                )),
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: Text(
                                  "Enregistré le ${dateFormat.format(dateTime)} ",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: AppText.appBarSubTitle),
                            ),
                          ],
                        )),
                ],
              )
            ])),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(
            IconAssets.arrow_left,
            color: AppColor.backgroundTextColor,
            width: 25,
            height: 25,
          ),
        ));
  }
}

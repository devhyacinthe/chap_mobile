import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/features/authentication/controllers/auth_controller.dart';
import 'package:chap_mobile/src/features/settings/controllers/settings_controller.dart';
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

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
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

  _clearUserProviderAfterLogout() {
    ref.read(accountFirstNameProvider.notifier).state = "";
    ref.read(accountLastNameProvider.notifier).state = "";
    ref.read(accountEmailProvider.notifier).state = "";
    ref.read(accountGenderProvider.notifier).state = "";
    ref.read(accountBirthdayProvider.notifier).state = "";
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    _initUserCredentials();
  }

  @override
  Widget build(BuildContext context) {
    var firstNameProvider = ref.watch(accountFirstNameProvider);
    var lastNameProvider = ref.watch(accountLastNameProvider);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.backgroundWhiteColor,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(context),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  color: AppColor.backgroundWhiteColor,
                  width: double.infinity,
                  padding: AppSize.paddingSettingPage,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColor.backgroundColor,
                            radius: 50,
                            child: CircleAvatar(
                              backgroundColor: AppColor.backgroundWhiteColor,
                              radius: 48,
                              child: SvgPicture.asset(
                                IconAssets.user,
                                color: AppColor.backgroundTextColor,
                                width: 75,
                                height: 75,
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
                                            color: AppColor.primaryColor,
                                            size: 25)),
                                  ],
                                ))
                              : Expanded(
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.only(left: 25),
                                        child: Row(
                                          children: [
                                            firstNameProvider.toString() != ""
                                                ? Text(firstNameProvider,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 2,
                                                    style: AppText.account)
                                                : Text("${user.firstName}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 2,
                                                    style: AppText.account),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            lastNameProvider.toString() != ""
                                                ? Text(
                                                    "${lastNameProvider[0]}.",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 2,
                                                    style: AppText.account)
                                                : Text("${user.lastName![0]}.",
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 1,
                                                    style: AppText.account),
                                          ],
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, top: 5),
                                      height: 35,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: AppColor.primaryColor
                                              .withOpacity(.2),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(30))),
                                      child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text("${user.rating}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: AppText.account)),
                                    )
                                  ],
                                )),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () =>
                                    context.pushNamed(AppRouteName.account),
                                icon: SvgPicture.asset(
                                  IconAssets.edit,
                                  color: AppColor.backgroundTextSecondaryColor,
                                  width: 25,
                                  height: 25,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        tileColor: AppColor.backgroundWhiteColor,
                        leading: SvgPicture.asset(
                          IconAssets.settings,
                          color: AppColor.backgroundTextSecondaryColor,
                          width: 25,
                          height: 25,
                        ),
                        title: Text(AppStrings.accountSettings,
                            style: AppText.tileSetting),
                        trailing: const Icon(Icons.chevron_right,
                            color: AppColor.backgroundTextSecondaryColor,
                            size: 25),
                      ),
                      _buildDivider(),
                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(
                          IconAssets.contact,
                          color: AppColor.backgroundTextSecondaryColor,
                          width: 25,
                          height: 25,
                        ),
                        title:
                            Text(AppStrings.help, style: AppText.tileSetting),
                        trailing: const Icon(Icons.chevron_right,
                            color: AppColor.backgroundTextSecondaryColor,
                            size: 25),
                        tileColor: AppColor.backgroundWhiteColor,
                      ),
                      _buildDivider(),
                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(
                          IconAssets.share,
                          color: AppColor.backgroundTextSecondaryColor,
                          width: 25,
                          height: 25,
                        ),
                        title:
                            Text(AppStrings.share, style: AppText.tileSetting),
                        trailing: const Icon(Icons.chevron_right,
                            color: AppColor.backgroundTextSecondaryColor,
                            size: 25),
                        tileColor: AppColor.backgroundWhiteColor,
                      ),
                      _buildDivider(),
                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(
                          IconAssets.info,
                          color: AppColor.backgroundTextSecondaryColor,
                          width: 25,
                          height: 25,
                        ),
                        title: Text(AppStrings.aPropos,
                            style: AppText.tileSetting),
                        trailing: const Icon(Icons.chevron_right,
                            color: AppColor.backgroundTextSecondaryColor,
                            size: 25),
                        tileColor: AppColor.backgroundWhiteColor,
                      ),
                      _buildDivider(),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _clearUserProviderAfterLogout();
                        ref
                            .read(authenticationControllerProvider)
                            .logout(context: context);
                      },
                      child: ListTile(
                        leading: const Icon(Icons.logout_rounded,
                            color: AppColor.errorAccentColor, size: 25),
                        title:
                            Text(AppStrings.logout, style: AppText.tileSetting),
                        tileColor: AppColor.backgroundWhiteColor,
                      ),
                    ),
                    Container(
                      color: AppColor.backgroundWhiteColor,
                      width: double.infinity,
                      padding: AppSize.paddingSettingPage,
                      margin: const EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(AppStrings.cdu,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: AppText.cgu),
                                ],
                              )),
                              Container(
                                  width: 1,
                                  height: 30,
                                  color: AppColor.primaryColor),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(AppStrings.contact,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: AppText.cgu),
                                ],
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text("Version ${AppStrings.version}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: AppText.version)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: AppColor.backgroundWhiteColor,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        title: Text('Compte', style: AppText.appBarTitle),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            IconAssets.arrow_left,
            color: AppColor.backgroundTextColor,
            width: 25,
            height: 25,
          ),
        ));
  }

  _buildDivider() {
    return const Divider(
      color: AppColor.backgroundTextColor,
      thickness: .02,
      endIndent: 15,
      indent: 55,
    );
  }
}

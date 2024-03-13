import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/global/widgets/primary_button.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundWhiteColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: AppSize.paddingPage,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(AppStrings.loginTitle, style: AppText.large),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(AppStrings.loginSubTitle,
                        textAlign: TextAlign.center,
                        style: AppText.secondaryTiny),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            color: AppColor.backgroundColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xffeeeeee),
                                  blurRadius: 10,
                                  offset: Offset(0, 4))
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.13))),
                        child: Stack(
                          children: [
                            Form(
                              key: _formKey,
                              child: InternationalPhoneNumberInput(
                                searchBoxDecoration: InputDecoration(
                                  hintText: 'Rechercher votre pays',
                                  contentPadding: const EdgeInsets.only(
                                      bottom: 10, left: 15),
                                  filled: true,
                                  enabled: true,
                                  fillColor: AppColor.backgroundColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: AppColor.primaryColor,
                                        width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: AppColor.primaryColor,
                                        width: 1.0),
                                  ),
                                ),
                                formatInput: false,
                                textFieldController: _phoneNumberController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Phone number is required';
                                  }
                                  return null;
                                },
                                countries: const ['TG', 'FR', 'BF', 'CI', 'SN'],
                                onInputChanged: (PhoneNumber phone) {},
                                initialValue: PhoneNumber(isoCode: 'TG'),
                                maxLength: 8,
                                selectorConfig: const SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET),
                                cursorColor: AppColor.primaryColor,
                                inputDecoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(bottom: 15, left: 0),
                                    border: InputBorder.none,
                                    hintText: 'Numéro de téléphone',
                                    hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: AppColor.backgroundTextColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ),
                            ),
                            Positioned(
                                left: 90,
                                top: 8,
                                bottom: 8,
                                child: Container(
                                    height: 40,
                                    width: 1,
                                    color: Colors.black.withOpacity(0.13)))
                          ],
                        )),
                    const SizedBox(
                      height: 60,
                    ),
                    PrimaryButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String phoneNumber =
                                _phoneNumberController.text.trim();
                            context.push('/password', extra: phoneNumber);
                          }
                        },
                        text: "Continuer"),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.loginInfo,
                            style: AppText.secondaryMiny),
                        TextButton(
                          onPressed: () =>
                              context.pushNamed(AppRouteName.register),
                          child: Text("S'inscrire",
                              style: AppText.secondaryMinyTextButton),
                        )
                      ],
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: AppColor.backgroundWhiteColor,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
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
}

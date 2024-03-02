import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/features/authentication/controllers/auth_controller.dart';
import 'package:chap_mobile/src/models/user.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:chap_mobile/src/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class PasswordPage extends ConsumerWidget with Validator {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  String? phoneNumber;

  PasswordPage({super.key, this.phoneNumber});

  final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: AppText.primaryTiny,
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.13),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.primaryColor)));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              padding: AppSize.paddingPage,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(AppStrings.passwordTitle, style: AppText.large),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(AppStrings.passwordSubTitle,
                            textAlign: TextAlign.center,
                            style: AppText.secondaryTiny),
                        const SizedBox(
                          height: 60,
                        ),
                        Pinput(
                          controller: _passwordController,
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                          autofocus: false,
                        ),
                        const SizedBox(
                          height: 65,
                        ),
                        MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                //concat phone number to togolese number
                                String number = "+228${phoneNumber!}";

                                User user = User(
                                    firstName: "",
                                    lastName: "",
                                    password: _passwordController.text,
                                    phoneNumber: number);

                                ref
                                    .read(authenticationControllerProvider)
                                    .login(context: context, user: user);
                              }
                            },
                            color: AppColor.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            height: 60,
                            child: Text("Valider", style: AppText.buttonText)),
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }
}

_buildAppBar(BuildContext context) {
  return AppBar(
      backgroundColor: AppColor.backgroundColor,
      elevation: 0,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      leading: IconButton(
        onPressed: () => context.pushNamed(AppRouteName.login),
        icon: SvgPicture.asset(
          IconAssets.arrow_left,
          color: AppColor.backgroundTextColor,
          width: 25,
          height: 25,
        ),
      ));
}

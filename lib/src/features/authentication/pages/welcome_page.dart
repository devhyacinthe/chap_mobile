import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/global/widgets/primary_button.dart';
import 'package:chap_mobile/src/global/widgets/secondary_button.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// This screen is the one you see when you enter the application if you're not logged in.
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundWhiteColor,
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(children: [
                      Text(AppStrings.welcomeTitle, style: AppText.large)
                    ]),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              scale: 3,
                              image: AssetImage(ImageAssets.welcomeImagePath))),
                    ),
                    Column(
                      children: [
                        PrimaryButton(
                            onPressed: () =>
                                context.pushNamed(AppRouteName.login),
                            text: "Connexion"),
                        const SizedBox(
                          height: 20,
                        ),
                        SecondaryButton(
                            onPressed: () =>
                                context.pushNamed(AppRouteName.register),
                            text: "Inscription")
                      ],
                    )
                  ],
                ))));
  }
}

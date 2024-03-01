import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/global/widgets/primary_button.dart';
import 'package:chap_mobile/src/global/widgets/secondary_button.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          .animate()
                          .moveY(duration: 500.ms)
                    ]),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              scale: 3,
                              image: AssetImage(ImageAssets.welcomeImagePath))),
                    ).animate().moveY(duration: 500.ms),
                    Column(
                      children: [
                        PrimaryButton(
                                onPressed: () =>
                                    context.pushNamed(AppRouteName.login),
                                text: "Connecter")
                            .animate()
                            .moveY(duration: 1000.ms),
                        const SizedBox(
                          height: 20,
                        ),
                        SecondaryButton(
                                onPressed: () =>
                                    context.pushNamed(AppRouteName.register),
                                text: "S'inscrire")
                            .animate()
                            .moveY(duration: 1000.ms)
                      ],
                    )
                  ],
                ))));
  }
}

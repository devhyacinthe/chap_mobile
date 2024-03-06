import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/global/controllers/init_controller.dart';
import 'package:chap_mobile/src/global/providers/common_providers.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    ref.read(initControllerProvider).getUserAndToken().then((value) {
      final user = ref.read(currentUserProvider);
      final token = ref.read(authTokenProvider);

      /// Check if both the [user] and [token] have value
      if (user == null || token == null) {
        /// Route the user to Authenticaion screen
        context.pushNamed(AppRouteName.welcome);
      } else {
        /// Route the user to Home screen
        context.pushNamed(AppRouteName.navigation);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundWhiteColor,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  scale: 3,
                  image: AssetImage(ImageAssets.welcomeImagePath))),
        ).animate().fadeOut(),
      ),
    );
  }
}

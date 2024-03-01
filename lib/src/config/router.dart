import 'package:chap_mobile/src/features/authentication/pages/login_page.dart';
import 'package:chap_mobile/src/features/authentication/pages/password_page.dart';
import 'package:chap_mobile/src/features/authentication/pages/register_page.dart';
import 'package:chap_mobile/src/features/authentication/pages/welcome_page.dart';
import 'package:chap_mobile/src/features/home/pages/home_page.dart';
import 'package:chap_mobile/src/global/pages/splash_screen.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
      name: AppRouteName.splash,
      path: '/',
      builder: (context, state) {
        return const SplashView();
      }),
  GoRoute(
      name: AppRouteName.welcome,
      path: '/welcome',
      builder: (context, state) {
        return const WelcomePage();
      }),
  GoRoute(
      name: AppRouteName.login,
      path: '/login',
      builder: (context, state) {
        return LoginPage();
      }),
  GoRoute(
      name: AppRouteName.register,
      path: '/register',
      builder: (context, state) {
        return RegisterPage();
      }),
  GoRoute(
      name: AppRouteName.password,
      path: '/password',
      builder: (context, state) {
        return PasswordPage();
      }),
  GoRoute(
      name: AppRouteName.home,
      path: '/home',
      builder: (context, state) {
        return const HomePage();
      }),
]);

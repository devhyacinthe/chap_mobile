import 'package:chap_mobile/src/config/router.dart';
import 'package:chap_mobile/src/config/theme.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      theme: theme(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

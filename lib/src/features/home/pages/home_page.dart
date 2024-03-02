import 'package:chap_mobile/src/features/authentication/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
            child: TextButton(
                onPressed: () {
                  ref
                      .read(authenticationControllerProvider)
                      .logout(context: context);
                },
                child: const Text('Deconnecter'))));
  }
}

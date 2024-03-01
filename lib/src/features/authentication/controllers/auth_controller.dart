import 'package:chap_mobile/src/core/core.dart';
import 'package:chap_mobile/src/features/authentication/configurations/messages.dart';
import 'package:chap_mobile/src/features/authentication/repositories/auth_repository.dart';
import 'package:chap_mobile/src/global/controllers/init_controller.dart';
import 'package:chap_mobile/src/models/user.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:chap_mobile/src/utils/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authenticationControllerProvider = Provider((ref) {
  final repository = ref.watch(authenticationRepositoryProvider);
  final credentials = ref.watch(initControllerProvider);
  return AuthenticationController(
      repository: repository, credentials: credentials);
});

class AuthenticationController {
  final AuthenticationRepository _repository;
  final InitController _credentials;

  AuthenticationController(
      {required AuthenticationRepository repository,
      required InitController credentials})
      : _repository = repository,
        _credentials = credentials;

  Future<User>? register({BuildContext? context, User? user}) async {
    final result = await _repository.register(user!);
    final userNull =
        User(firstName: "", lastName: "", password: "", phoneNumber: "");
    return result.fold((failure) {
      if (context != null) {
        SnackBarService.showSnackBar(
            context: context, message: FailureMessage.register);
      }
      return userNull;
    }, (user) {
      if (context != null) {
        context.pushNamed(AppRouteName.login);
        SnackBarService.showSnackBar(
            context: context, message: SuccessMessage.register);
      }
      return user;
    });
  }
}

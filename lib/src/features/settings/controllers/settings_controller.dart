import 'package:chap_mobile/src/features/settings/configurations/messages.dart';
import 'package:chap_mobile/src/features/settings/repositories/settings_repository.dart';
import 'package:chap_mobile/src/global/controllers/init_controller.dart';
import 'package:chap_mobile/src/models/user.dart';
import 'package:chap_mobile/src/models/user_response.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:chap_mobile/src/utils/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final settingsControllerProvider = Provider((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  final credentials = ref.watch(initControllerProvider);

  return SettingsController(repository: repository, credentials: credentials);
});

class SettingsController {
  final SettingsRepository _repository;
  final InitController _credentials;

  SettingsController(
      {required SettingsRepository repository,
      required InitController credentials})
      : _repository = repository,
        _credentials = credentials;

  Future<UserResponse> userProfile(
      {BuildContext? context, String? phoneNumber}) async {
    final result = await _repository.userProfile(phoneNumber!);
    final userNull = UserResponse.empty();

    return result.fold((failure) {
      if (context != null) {
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 2),
            context: context,
            message: FailureMessage.userProfile,
            backgroundColor: AppColor.errorColor);
      }
      return userNull;
    }, (user) {
      if (context != null) {
        return user;
      }
      return user;
    });
  }

  Future<String> updatedUserProfile(
      {BuildContext? context,
      String? phoneNumber,
      Map<String, dynamic>? updatedUserMap}) async {
    final result =
        await _repository.updatedUserProfile(phoneNumber!, updatedUserMap!);

    return result.fold((failure) {
      if (context != null) {
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 2),
            context: context,
            message: FailureMessage.updatedUserProfile,
            backgroundColor: AppColor.errorColor);
      }
      return "";
    }, (message) {
      if (context != null && message == AppStrings.updatedProfileError) {
        SnackBarService.showSnackBar(
            duration: const Duration(seconds: 2),
            context: context,
            message: FailureMessage.updatedUserProfile,
            backgroundColor: AppColor.errorColor);
        return message;
      }
      if (context != null && message != AppStrings.updatedProfileError) {
        context.pop();
        return message;
      }
      return message;
    });
  }
}

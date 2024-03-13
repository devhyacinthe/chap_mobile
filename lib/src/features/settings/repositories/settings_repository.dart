import 'dart:convert';
import 'dart:developer';
import 'package:chap_mobile/src/core/core.dart';
import 'package:chap_mobile/src/core/network.dart';
import 'package:chap_mobile/src/features/settings/configurations/endpoints.dart';
import 'package:chap_mobile/src/features/settings/configurations/messages.dart';
import 'package:chap_mobile/src/models/user_response.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

final settingsRepositoryProvider = Provider((ref) {
  final api = ref.watch(networkRepositoryProvider);
  return SettingsRepository(api: api);
});

class SettingsRepository {
  final NetworkRepository _api;
  final _name = "SETTINGS_CONTROLLER";

  SettingsRepository({required NetworkRepository api}) : _api = api;

  FutureEither<UserResponse> userProfile(String phoneNumber) async {
    final result =
        await _api.getRequest(url: "${EndPoints.profileUser}$phoneNumber");

    return result.fold((Failure failure) {
      log(failure.message, name: _name);
      return Left(failure);
    }, (Response response) {
      try {
        if (response.statusCode >= 400 || response.statusCode == 204) {
          UserResponse userNull = UserResponse.empty();

          return Right(userNull);
        }

        final data = jsonDecode(response.body);
        log(data.toString(), name: _name);

        UserResponse userResponse = UserResponse.fromMap(data);

        return Right(userResponse);
      } catch (e, stktrc) {
        log(FailureMessage.jsonParseFailed, name: _name);
        return Left(Failure(
          message: FailureMessage.jsonParseFailed,
          stackTrace: stktrc,
        ));
      }
    });
  }

  FutureEither<String> updatedUserProfile(
      String phoneNumber, Map<String, dynamic> updatedUserMap) async {
    final result = await _api.putRequest(
        url: "${EndPoints.updatedUserProfile}$phoneNumber",
        body: updatedUserMap);

    return result.fold((Failure failure) {
      log(failure.message, name: _name);
      return Left(failure);
    }, (Response response) {
      try {
        if (response.statusCode >= 400 || response.statusCode == 204) {
          String message = AppStrings.updatedProfileError;

          return Right(message);
        }

        final data = jsonDecode(response.body);
        log(data.toString(), name: _name);

        var message = data['message'];

        return Right(message);
      } catch (e, stktrc) {
        log(FailureMessage.jsonParseFailed, name: _name);
        return Left(Failure(
          message: FailureMessage.jsonParseFailed,
          stackTrace: stktrc,
        ));
      }
    });
  }
}

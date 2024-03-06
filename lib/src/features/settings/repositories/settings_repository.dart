import 'dart:convert';
import 'dart:developer';

import 'package:chap_mobile/src/core/core.dart';
import 'package:chap_mobile/src/core/network.dart';
import 'package:chap_mobile/src/features/settings/configurations/messages.dart';
import 'package:chap_mobile/src/models/user.dart';
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

  FutureEither<User> userProfile(String phoneNumber) async {
    final result = await _api.getRequest(
        url: "http://10.0.2.2:3000/api/v1/user/profile/$phoneNumber");

    return result.fold((Failure failure) {
      log(failure.message, name: _name);
      return Left(failure);
    }, (Response response) {
      try {
        if (response.statusCode >= 400 || response.statusCode == 204) {
          User userNull =
              User(firstName: "", lastName: "", password: "", phoneNumber: "");

          return Right(userNull);
        }

        final data = json.decode(response.body);
        log(data.toString(), name: _name);

        User userResponse = User.fromMapResponse(data);

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
}

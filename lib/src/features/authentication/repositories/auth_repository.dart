import 'dart:convert';
import 'dart:developer';

import 'package:chap_mobile/src/core/core.dart';
import 'package:chap_mobile/src/features/authentication/configurations/endpoints.dart';
import 'package:chap_mobile/src/features/authentication/configurations/messages.dart';
import 'package:chap_mobile/src/models/user.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

final authenticationRepositoryProvider = Provider((ref) {
  final api = ref.watch(networkRepositoryProvider);
  return AuthenticationRepository(api: api);
});

class AuthenticationRepository {
  final NetworkRepository _api;
  final _name = "AUTHENTICATION_CONTROLLER";

  AuthenticationRepository({required NetworkRepository api}) : _api = api;

  FutureEither<User> register(User? user) async {
    final result = await _api.postRequest(
        url: EndPoints.registerUser, requireAuth: false, body: user!.toMap());

    return result.fold((Failure failure) {
      log(failure.message, name: _name);
      return Left(failure);
    }, (Response response) {
      try {
        if (response.statusCode >= 400) {
          User userNull =
              User(firstName: "", lastName: "", password: "", phoneNumber: "");

          return Right(userNull);
        }

        final data = json.decode(response.body);
        log(data.toString(), name: _name);

        User userResponse = User.fromMap(data);

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

  FutureEither<String> login(String? phoneNumber, String? password) async {
    final result = await _api.postRequest(
        url: EndPoints.loginUser,
        requireAuth: false,
        body: {'phoneNumber': phoneNumber!, 'password': password!});

    return result.fold((Failure failure) {
      log(failure.message, name: _name);
      return Left(failure);
    }, (Response response) {
      try {
        if (response.statusCode >= 400) {
          String message = AppStrings.passwordError;

          return Right(message);
        }

        final data = json.decode(response.body);
        log(data.toString(), name: _name);

        String token = data['token'];

        return Right(token);
      } catch (e, stktrc) {
        log(FailureMessage.jsonParseFailed, name: _name);
        return Left(Failure(
          message: FailureMessage.jsonParseFailed,
          stackTrace: stktrc,
        ));
      }
    });
  }

  FutureEither<String> logout() async {
    final result =
        await _api.getRequest(url: EndPoints.logoutUser, requireAuth: false);

    return result.fold((Failure failure) {
      log(failure.message, name: _name);
      return Left(failure);
    }, (Response response) {
      try {
        if (response.statusCode >= 400) {
          String message = AppStrings.passwordError;

          return Right(message);
        }

        final data = json.decode(response.body);
        log(data.toString(), name: _name);

        String message = data['message'];

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

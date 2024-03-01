import 'dart:convert';
import 'dart:developer';

import 'package:chap_mobile/src/core/core.dart';
import 'package:chap_mobile/src/features/authentication/configurations/endpoints.dart';
import 'package:chap_mobile/src/features/authentication/configurations/messages.dart';
import 'package:chap_mobile/src/models/user.dart';
import 'package:flutter/material.dart';
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
}

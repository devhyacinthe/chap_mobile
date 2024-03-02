import 'dart:convert';
import 'dart:developer';

import 'package:chap_mobile/src/global/providers/common_providers.dart';
import 'package:chap_mobile/src/utils/config.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

/// Watch apiProvider to make sure to have the latest authToken passed.

final networkRepositoryProvider = StateProvider((ref) {
  final authToken = ref.watch(authTokenProvider);
  return NetworkRepository(authToken: authToken);
});

/// Contains common methods required for client side APIs [GET, POST, PUT, DELETE].
/// Pass the [url] from endpoints using [Endpoints] class.
/// Every method has an optional parameter [requireAuth] default [true].
/// Set [requireAuth] to [false] if [authToken] is Empty.
class NetworkRepository {
  final String? _authToken;

  NetworkRepository({required String? authToken}) : _authToken = authToken;

  FutureEither<Response> getRequest(
      {required String url, bool requireAuth = true}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_authToken"
    };
    if (requireAuth) {
      if ((_authToken ?? '').isEmpty) {
        return Left(Failure(message: NetworkFailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpGet);
      log('requireAuth : $requireAuth', name: LogLabel.httpGet);
    }
    try {
      final response = await get(Uri.parse(url), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpGet);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: NetworkFailureMessage.getRequestMessage,
          stackTrace: stktrc));
    }
  }

  FutureEither<Response> postRequest(
      {required String url, dynamic body, bool requireAuth = true}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_authToken"
    };
    if (requireAuth) {
      if ((_authToken ?? '').isEmpty) {
        return Left(Failure(message: NetworkFailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPost);
      log('requireAuth : $requireAuth', name: LogLabel.httpPost);
      log('BODY : $body', name: LogLabel.httpPost);
    }
    try {
      final response = await post(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpPost);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: NetworkFailureMessage.postRequestMessage,
          stackTrace: stktrc));
    }
  }

  FutureEither<Response> putRequest(
      {required String url, dynamic body, bool requireAuth = true}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_authToken"
    };
    if (requireAuth) {
      if ((_authToken ?? '').isEmpty) {
        return Left(Failure(message: NetworkFailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPut);
      log(
        'requireAuth : $requireAuth',
        name: LogLabel.httpPut,
      );
      log('BODY : $body', name: LogLabel.httpPut);
    }
    try {
      final response = await put(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpPut);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: NetworkFailureMessage.putRequestMessage,
          stackTrace: stktrc));
    }
  }

  FutureEither<Response> deleteRequest(
      {required String url, dynamic body, bool requireAuth = true}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_authToken"
    };
    if (requireAuth) {
      if ((_authToken ?? '').isEmpty) {
        return Left(Failure(message: NetworkFailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpDelete);
      log('requireAuth : $requireAuth', name: LogLabel.httpDelete);
      log('BODY : $body', name: LogLabel.httpDelete);
    }
    try {
      final response = await delete(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpDelete);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: NetworkFailureMessage.deleteRequestMessage,
          stackTrace: stktrc));
    }
  }
}

import 'package:chap_mobile/src/core/core.dart';
import 'package:chap_mobile/src/global/controllers/shared_prefs_controller.dart';
import 'package:chap_mobile/src/global/providers/common_providers.dart';
import 'package:chap_mobile/src/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initControllerProvider = Provider((ref) => InitController(ref: ref));

class InitController {
  final Ref _ref;

  InitController({required Ref ref}) : _ref = ref;

  FutureVoid getUserAndToken() async {
    await _ref.read(sharedPrefsControllerPovider).getUser().then((value) {
      _ref.read(currentUserProvider.notifier).update((state) => value);
    });

    await _ref.read(sharedPrefsControllerPovider).getCookie().then((value) {
      _ref.read(authTokenProvider.notifier).update((state) => value);
    });
  }

  FutureVoid initUserAndToken(User user, String token) async {
    await _ref.read(sharedPrefsControllerPovider).setUser(user: user);

    await _ref.read(sharedPrefsControllerPovider).setToken(token: token);
  }

  FutureVoid clearUserAndToken() async {
    await _ref.read(sharedPrefsControllerPovider).clear();

    await _ref.read(sharedPrefsControllerPovider).clear();
  }
}

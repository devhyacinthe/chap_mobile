import 'package:chap_mobile/src/core/core.dart';
import 'package:chap_mobile/src/global/repositories/shared_prefs_repo.dart';
import 'package:chap_mobile/src/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sharedPrefsControllerPovider = Provider((ref) {
  final repository = ref.watch(sharedPrefsRepositoryProvider);
  return SharedPrefsController(repository: repository);
});

class SharedPrefsController {
  final SharedPrefsRepository _repo;

  SharedPrefsController({required SharedPrefsRepository repository})
      : _repo = repository;

  Future<String?> getCookie() async {
    return _repo.getCookie();
  }

  FutureVoid setToken({required String token}) async {
    await _repo.setToken(token);
  }

  Future<User?> getUser() async {
    return _repo.getCurrentUser();
  }

  FutureVoid setUser({required User user}) async {
    _repo.setCurrentUser(user);
  }

  FutureVoid clear() async {
    return _repo.clear();
  }
}

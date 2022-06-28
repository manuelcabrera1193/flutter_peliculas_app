
import 'package:peliculas_app/data/local/secure_storage.dart';
import 'package:peliculas_app/domain/repository/local_repository.dart';

class LocalRepositoryImp extends LocalRepository {
  final secureStorage = SecureStorage();

  @override
  Future<void> clearUserData() {
    return secureStorage.clearUserData();
  }

  @override
  Future<void> closeSession() {
    return secureStorage.closeSession();
  }

  @override
  Future<String?> getExpiresIn() {
    return secureStorage.getExpiresIn();
  }

  @override
  Future<String?> getFirstlogin() {
    return secureStorage.getFirstlogin();
  }

  @override
  Future<String?> getRefreshToken() {
    return secureStorage.getRefreshToken();
  }

  @override
  Future<String?> getToken() {
    return secureStorage.getToken();
  }

  @override
  Future<String?> getUserSub() {
    return secureStorage.getUserSub();
  }

  @override
  Future<String?> getUsername() {
    return secureStorage.getUsername();
  }

  @override
  Future<void> setExpiresIn(String value) {
    return secureStorage.setExpiresIn(value);
  }

  @override
  Future<void> setFirstlogin(String value) {
    return secureStorage.setFirstlogin(value);
  }

  @override
  Future<void> setRefreshToken(String value) {
    return secureStorage.setRefreshToken(value);
  }

  @override
  Future<void> setToken(String value) {
    return secureStorage.setToken(value);
  }

  @override
  Future<void> setUserSub(String value) {
    return secureStorage.setUserSub(value);
  }

  @override
  Future<void> setUsername(String value) {
    return secureStorage.setUsername(value);
  }

  @override
  Future<String?> getListBibliotec() {
    return secureStorage.getListBibliotec();
  }

  @override
  Future<void> setListBibliotec(String vkBibliotec) {
    return secureStorage.setListBibliotec(vkBibliotec);
  }
}

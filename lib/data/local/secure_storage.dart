
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final flutterSecureStorage = const FlutterSecureStorage();
  final kToken = "F64nY3NLn8uq7ByYgQHnhLvcbjm8Wo";
  final kRefreshToken = "iFh2Ww9aSxiFh2Ww9aSxK5M6ZhikK5M6Zh";
  final kUsername = "em2cwk5z0noMSdNO2ikiWoA77ww3BTndWS5Hk";
  final kUserSub = "NR9e18VE2MB9HJ4ptGMsXueJ4oVv53eOtB";
  final kFirstLogin = "d06bImktivwRNknlfR6z4KX5FM8vXAE0tLwDb";
  final kExpiresIn = "dWWjzBeTjNaRBOzPeCmuga1Wha6N5o3ReqPmSoMZA";
  final kBibliotec = "dWWjzBeTjNaRlsljshaBOzPeCmuga1Wha6N5o3ReqPmSoMZA";

  Future<String?> getListBibliotec() {
    return flutterSecureStorage.read(key: kBibliotec);
  }

  Future<void> setListBibliotec(String vkBibliotec) {
    return flutterSecureStorage.write(key: kBibliotec, value: vkBibliotec);
  }

  Future<String?> getFirstlogin() {
    return flutterSecureStorage.read(key: kFirstLogin);
  }

  Future<void> setFirstlogin(String isFirstLogin) {
    return flutterSecureStorage.write(key: kFirstLogin, value: isFirstLogin);
  }

  Future<String?> getToken() {
    return flutterSecureStorage.read(key: kToken);
  }

  Future<void> setToken(String? token) {
    return flutterSecureStorage.write(key: kToken, value: token);
  }

  Future<String?> getRefreshToken() {
    return flutterSecureStorage.read(key: kRefreshToken);
  }

  Future<void> setRefreshToken(String? refreshToken) {
    return flutterSecureStorage.write(key: kRefreshToken, value: refreshToken);
  }

  Future<String?> getUsername() {
    return flutterSecureStorage.read(key: kUsername);
  }

  Future<void> setUsername(String? username) {
    return flutterSecureStorage.write(key: kUsername, value: username);
  }

  Future<String?> getUserSub() {
    return flutterSecureStorage.read(key: kUserSub);
  }

  Future<void> setUserSub(String? sub) {
    return flutterSecureStorage.write(key: kUserSub, value: sub);
  }

  Future<String?> getExpiresIn() {
    return flutterSecureStorage.read(key: kExpiresIn);
  }

  Future<void> setExpiresIn(String expiresIn) {
    return flutterSecureStorage.write(key: kExpiresIn, value: expiresIn);
  }

  Future<bool?> clearUserData() {
    return flutterSecureStorage.deleteAll().then((value) => value as bool?);
  }

  Future<void> closeSession() async {
    await flutterSecureStorage.write(key: kToken, value: '');
    await flutterSecureStorage.write(key: kExpiresIn, value: '');
    await flutterSecureStorage.write(key: kUserSub, value: '');
    await flutterSecureStorage.write(key: kUsername, value: '');
  }
}

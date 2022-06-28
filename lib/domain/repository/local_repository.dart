abstract class LocalRepository {
  Future<String?> getListBibliotec();
  Future<void> setListBibliotec(String vkBibliotec);

  Future<String?> getFirstlogin();
  Future<void> setFirstlogin(String value);

  Future<String?> getToken();
  Future<void> setToken(String value);

  Future<String?> getRefreshToken();
  Future<void> setRefreshToken(String value);

  Future<String?> getUsername();
  Future<void> setUsername(String value);

  Future<String?> getUserSub();
  Future<void> setUserSub(String value);

  Future<String?> getExpiresIn();
  Future<void> setExpiresIn(String value);

  Future<void> clearUserData();
  Future<void> closeSession();
}

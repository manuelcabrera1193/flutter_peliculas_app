import 'package:get/get_connect/connect.dart';
import 'package:peliculas_app/data/local/secure_storage.dart';
import 'package:peliculas_app/data/utils/network_constants.dart';
import 'package:peliculas_app/domain/models/logout_request.dart';
import 'package:peliculas_app/domain/models/refresh_token_response.dart';
import 'package:peliculas_app/domain/models/token_request.dart';

class TokenService extends GetConnect {
  final secureStorage = SecureStorage();

  Future<RefreshTokenResponse?> token(TokenRequest request) async {
    final $headers = {'content-type': 'application/x-www-form-urlencoded'};
    final response = await post(
      "${NetworkConstants.baseUrl}/token",
      request.toMap(),
      headers: $headers,
    );
    if (response.statusCode == 200) {
      print("token success response: ${response.body}");
      return RefreshTokenResponse(accessToken: response.body.accessToken);
    } else {
      print("token error response: ${response.body}");
      return null;
    }
  }

  Future<bool> logout() async {
    final $headers = {'content-type': 'application/x-www-form-urlencoded'};
    String? refreshToken = await secureStorage.getRefreshToken();
    final request = LogoutRequest(
      "NetworkConstants.KEYCLOAK_CLIENT_ID",
      "NetworkConstants.KEYCLOAK_CLIENT_SECRET",
      refreshToken ?? "",
    );
    final response = await post(
      "${NetworkConstants.baseUrl}/logout",
      request.toMap(),
      headers: $headers,
    );
    if (response.statusCode == 204) {
      print("logout success response: ${response.body}");
      await secureStorage.closeSession();
      return true;
    } else {
      print("logout error response: ${response.body}");
      return false;
    }
  }
}

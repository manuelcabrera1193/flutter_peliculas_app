import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:peliculas_app/data/local/secure_storage.dart';
import 'package:peliculas_app/data/services/token_service.dart';
import 'package:peliculas_app/data/utils/network_constants.dart';
import 'package:peliculas_app/domain/models/token_request.dart';

class BaseServiceAuth extends GetConnect {
  final secureStorage = SecureStorage();
  final tokenService = TokenService();
  bool config() {
    // httpClient.addRequestModifier((Request request) async {
    //   String token = await secureStorage.getToken() ?? "";

    //   if (request.url.toString().contains(NetworkConstants.baseUrl)) {
    //     request.headers['Authorization'] = "Bearer $token";
    //     print("Ingresa a modificar el request");
    //   }
    //   return request;
    // });
    // httpClient.addResponseModifier((request, response) async {
    //   print("request url: ${request.url}");
    //   if (response.statusCode == 401) {
    //     final refreshToken = await secureStorage.getRefreshToken() ?? "";
    //     print("refreshToken: $refreshToken");
    //     final tokenResponse = await tokenService.token(
    //       TokenRequest(
    //           "NetworkConstants.KEYCLOAK_CLIENT_ID",
    //           "NetworkConstants.KEYCLOAK_CLIENT_SECRET",
    //           refreshToken,
    //           "refresh_token"),
    //     );
    //     secureStorage.setToken(tokenResponse?.accessToken);
    //     request.headers['Authorization'] =
    //         "Bearer ${tokenResponse?.accessToken}";
    //     return request;
    //   }
    //   print("response statusCode: ${response.statusCode}");
    //   return response;
    // });
    // httpClient.addAuthenticator((Request request) async {
    //   final refreshToken = await secureStorage.getRefreshToken() ?? "";
    //   final tokenResponse = await tokenService.token(
    //     TokenRequest(
    //         "NetworkConstants.KEYCLOAK_CLIENT_ID",
    //         "NetworkConstants.KEYCLOAK_CLIENT_SECRET",
    //         refreshToken,
    //         "refresh_token"),
    //   );
    //   secureStorage.setToken(tokenResponse?.accessToken);
    //   request.headers['Authorization'] = "Bearer ${tokenResponse?.accessToken}";
    //   print("Ingresa a agregar el nuevo token");
    //   return request;
    // });
    httpClient.maxAuthRetries = 3;
    httpClient.timeout = const Duration(seconds: 60);
    return true;
  }
}

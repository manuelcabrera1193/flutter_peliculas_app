class LogoutRequest {
  final String clientId;
  final String clientSecret;
  final String refreshToken;

  LogoutRequest(
      this.clientId, this.clientSecret, this.refreshToken);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map["client_id"] = clientId;
    map["client_secret"] = clientSecret;
    map["refresh_token"] = refreshToken;
    return map;
  }
}

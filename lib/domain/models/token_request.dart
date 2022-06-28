class TokenRequest {
  final String clientId;
  final String clientSecret;
  final String refreshToken;
  final String grantType;

  TokenRequest(
      this.clientId, this.clientSecret, this.refreshToken, this.grantType);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map["client_id"] = clientId;
    map["client_secret"] = clientSecret;
    map["refresh_token"] = refreshToken;
    map["grant_type"] = grantType;
    return map;
  }
}


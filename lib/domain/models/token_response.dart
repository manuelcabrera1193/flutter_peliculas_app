class TokenResponse {
  String? accessToken;
  String? expiresIn;
  String? idToken;
  String? netBeforePolicy;
  String? refreshExpiresIn;
  String? refreshToken;
  String? scope;
  String? sessionState;
  String? tokenType;

  TokenResponse(
      this.accessToken,
      this.expiresIn,
      this.idToken,
      this.netBeforePolicy,
      this.refreshExpiresIn,
      this.refreshToken,
      this.scope,
      this.sessionState,
      this.tokenType);
}

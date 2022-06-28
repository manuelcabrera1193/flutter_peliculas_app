// To parse this JSON data, do
//
//     final refreshTokenResponse = refreshTokenResponseFromMap(jsonString);

import 'dart:convert';

class RefreshTokenResponse {
    RefreshTokenResponse({
        required this.accessToken,
    });

    String accessToken;

    factory RefreshTokenResponse.fromJson(String str) => RefreshTokenResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RefreshTokenResponse.fromMap(Map<String, dynamic> json) => RefreshTokenResponse(
        accessToken: json["accessToken"],
    );

    Map<String, dynamic> toMap() => {
        "accessToken": accessToken,
    };
}

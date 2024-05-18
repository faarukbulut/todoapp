import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String? email;
  String? password;
  bool? returnSecureToken;

  LoginRequest({
    this.email,
    this.password,
    this.returnSecureToken,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    email: json["email"] ?? "",
    password: json["password"] ?? "",
    returnSecureToken: json["returnSecureToken"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "email": email ?? "",
    "password": password ?? "",
    "returnSecureToken": returnSecureToken ?? false,
  };
}

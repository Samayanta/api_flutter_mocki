import 'dart:convert';

List<Auth> authFromJson(String str) =>
    List<Auth>.from(json.decode(str).map((x) => Auth.fromJson(x)));

String authToJson(List<Auth> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Auth {
  String email;
  String password;

  Auth({
    required this.email,
    required this.password,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

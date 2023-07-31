class LoginModel {
  final String idToken;
  final String accessToken;

  LoginModel({
    required this.idToken,
    required this.accessToken,
  });

  Map toJson() => {
        "idtoken": idToken,
        "accessToken": accessToken,
      };
}

class JwtTokenGet {
  final String token;

  JwtTokenGet({required this.token});

  factory JwtTokenGet.fromJson(Map json) {
    return JwtTokenGet(token: json["token"] ?? "");
  }
}

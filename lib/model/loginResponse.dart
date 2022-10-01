// {"token":"QpwL5tke4Pnpja7X4"}

class LoginResponse {
  final String? token;
  LoginResponse({this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}


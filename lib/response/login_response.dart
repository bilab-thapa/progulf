class LoginResponse {
  String? email;
  String? password;
  String? token;

  LoginResponse({this.email, this.password, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'token': token,
      };
}

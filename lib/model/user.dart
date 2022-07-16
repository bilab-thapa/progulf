class User {
  String? email;
  String? username;
  String? password;
  String? age;

  User({this.email, this.username, this.password, this.age});

//converting json file from server to an object in dart
  factory User.fromJson(Map<String, dynamic> json) => User(
      email: json["email"],
      username: json["username"],
      password: json["password"],
      age: json['age']);

//converting the data to send into server in json
  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
        "age": age,
      };
}

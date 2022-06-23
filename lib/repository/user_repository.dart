import 'package:progulf/api/user_api.dart';
import 'package:progulf/model/user.dart';
import 'package:progulf/response/user_response.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserApi().registerUser(user);
  }

  Future<bool> login(String email, String password) async {
    return UserApi().login(email, password);
  }

  Future<UserResponse> userInfo() async {
    return UserApi().userInfo();
  }
}

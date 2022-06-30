import 'package:flutter_test/flutter_test.dart';
import 'package:progulf/model/user.dart';
import 'package:progulf/repository/user_repository.dart';

void main() {
  UserRepository? userRepository;
  setUp(() {
    userRepository = UserRepository();
  });
  test('User Registration', () async {
    bool expectedValue = true;
    User user =
        User(email: "thapa@gmail.com", username: "bilab", password: "hello");
    bool actualResult = await UserRepository().registerUser(user);
    expect(actualResult, expectedValue);
  });

  tearDown(() {
    
  });
}

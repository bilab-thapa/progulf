import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:progulf/model/favourite.dart';
import 'package:progulf/model/user.dart';
import 'package:progulf/repository/product_repository.dart';
import 'package:progulf/repository/user_repository.dart';
import 'package:progulf/response/get_product_response.dart';

void main() {
  UserRepository? userRepository;
  ProductResponse? productResponse;
  ProductRepository? productRepository;
  Box box;
  setUp(() {
    userRepository = UserRepository();
  });
  group('User API test', () {
    test('User Registration', () async {
      bool expectedValue = true;
      User user = User(
          email: "thapa@biasdlaasdasb.com",
          username: "hasddellouasdassertest",
          password: "hellasdao",
          age: "21");
      bool actualResult = await UserRepository().registerUser(user);
      expect(actualResult, expectedValue);
    });
    test('User Login', () async {
      bool expectedValue = true;
      final email = "bilabthapa";
      final password = "bilab123";

      bool actualResult = await UserRepository().login(email, password);
      expect(actualResult, expectedValue);
    });
  });

  group('Product Testing', () async {
    var box = await Hive.openBox('testFavourite');
    test('Favourite', () async {
      FavouriteM favourite = FavouriteM(
        name: "test",
        price: "test",
        image: "test",
      );
      box.add(favourite);
    });

    test('Get All Products', () async {
      productResponse = await productRepository!.getProducts();
      bool expectedResult = true;
      bool actualResult = false;
      if (productResponse!.data!.isNotEmpty) {
        actualResult = true;
      }
      expect(actualResult, expectedResult);
    });
  });

  tearDown(() {
    userRepository = null;
  });
}

import '../api/product_api.dart';

class ProductRepository {
  // Future<bool> addProduct(File? file, Product product) async {
  //   return ProductAPI().addProduct(file, product);
  // }

  Future<ProductResponse?> getProducts() async {
    return ProductAPI().getProducts();
  }
}

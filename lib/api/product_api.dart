import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:progulf/api/http_services.dart';

import '../response/get_produt_response.dart';
import '../utils/url.dart';

class ProductAPI {
  Future<bool> addProduct(File? file) async {
    try {
      var url = baseUrl + addProductUrl;
      var dio = HttpServices().getDioInstance();
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);

        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split("/").last,
          contentType: MediaType("image", mimeType!.split("/")[1]),
        ); //
      }
      var formData = FormData.fromMap({
        "name": "productname",
        "price": "100",
        "description": "Product Description",
        "image": image,
        "category": "62a048cccc22ba139c4fef01",
        "countInStock": "2",
        "rating": "3",
        "numReviews": "4",
        "isFeatured": "true",
      });
      var response = await dio.post(url, data: formData);
    } catch (e) {
      throw Exception(e);
    }
    return false;
  }
}

Future<ProductResponse?> getProducts() async {
  Future.delayed(const Duration(seconds: 2), () {});
  ProductResponse? productResponse;
  try {
    var dio = HttpServices().getDioInstance();
    Response response = await dio.get(getProduct);
    if (response.statusCode == 201) {
      productResponse = ProductResponse.fromJson(response.data);
    } else {
      productResponse = null;
    }
  } catch (e) {
    throw Exception(e);
  }
  return productResponse;
}

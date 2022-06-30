import 'package:eshopping/response/product_category.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:progulf/model/product_model.dart';

part 'get_product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool? success;
  List<ProductModel>? data;

  ProductResponse({this.success, this.data});
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

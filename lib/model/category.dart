// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? color;
  String? icon;
  String? image;

  Category({
    this.id,
    this.name,
    this.color,
    this.icon,
    this.image,
  });
}

class Product {
  String? productname;
  String? price;
  String? description;
  String? quantity;
  String? category;

  Product(
      {this.productname,
      this.price,
      this.description,
      this.quantity,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    productname = json['productname'];
    price = json['price'];
    description = json['description'];
    quantity = json['quantity'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productname'] = this.productname;
    data['price'] = this.price;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['category'] = this.category;
    return data;
  }
}

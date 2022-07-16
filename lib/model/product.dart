class Product {
  String? name;
  String? price;
  String? description;
  String? qty;
  String? category;
  String? image;

  Product(
      {this.name,
      this.price,
      this.description,
      this.qty,
      this.category,
      this.image});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    qty = json['qty'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['qty'] = this.qty;
    data['category'] = this.category;
    data['image'] = this.image;
    return data;
  }
}

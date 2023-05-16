class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  double? rate;
  int? count;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rate,
      required this.count});

  Product.fromjson(Map<String, dynamic> json) {
    id = json['id'] ?? 1;
    title = json['title'] ?? '';
    price = (json['price'] ?? 1).toDouble();
    description = json['description'] ?? '';
    category = json['category'] ?? '';
    image = json['image'] ?? '';
    rate = (json['rating']['rate'] ?? 1).toDouble();
    count = json['rating']['count'] ?? 0;
  }
}

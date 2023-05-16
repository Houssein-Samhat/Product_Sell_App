import 'dart:convert';
import 'package:http/http.dart';
import '../models/product.dart';

Future<List<Product>> get_products() async {
  Uri url = Uri.parse('https://fakestoreapi.com/products');
  Response response = await get(url);
  if (response.statusCode == 200) {
    final list = json.decode(response.body) as List<dynamic>;
    return list.map((json) => Product.fromjson(json)).toList();
  }
  return [];
}

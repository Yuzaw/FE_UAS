import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductController {
  final String baseUrl = 'http://127.0.0.1:8000/api/products';

  Future getProducts() async {
    var response = await http.get(Uri.parse(baseUrl));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteProduct(String productId) async {
    String url = '$baseUrl/$productId';
    var response = await http.delete(Uri.parse(url));
    return json.decode(response.body);
  }

  Future updateProduct(Map productData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${productData['id']}'),
      body: {
        'produk': productData['produk'],
        'kategori': productData['kategori'],
        'harga': productData['harga'].toString(),
        'deskripsi': productData['deskripsi'],
        'img': productData['img'],
      },
    );
    print(response.body);

    return json.decode(response.body);
  }

  Future saveProduct(Map productData) async {
    final response = await http.post(Uri.parse(baseUrl), body: {
      'produk': productData['produk'],
      'kategori': productData['kategori'],
      'harga': productData['harga'],
      'deskripsi': productData['deskripsi'],
      'img': productData['img'],
    });

    return json.decode(response.body);
  }
}

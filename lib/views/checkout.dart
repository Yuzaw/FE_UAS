import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final Map product;

  CheckoutPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 180,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    child: Image.network(product['img']),
                  ),
                  Text(
                    'Product: ${product['produk']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Price: Rp. ${product['harga']}'),
                  // Tambahkan informasi lainnya sesuai kebutuhan
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

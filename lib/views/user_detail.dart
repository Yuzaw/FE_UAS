import 'package:flutter/material.dart';
import 'package:quantum/views/checkout.dart';

class UserDetail extends StatelessWidget {
  final Map product;

  UserDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            child: Image.network(product['img']),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product['produk'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Rp.', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      product['harga'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk menambahkan ke keranjang
                        },
                        child: Text('Add to Cart'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigasi ke halaman Checkout saat tombol "Buy Now" ditekan
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutPage(product: product,),
                            ),
                          );
                        },
                        child: Text('Buy Now'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product['deskripsi']),
          )
        ],
      ),
    );
  }
}

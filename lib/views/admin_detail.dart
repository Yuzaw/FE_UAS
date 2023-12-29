import 'package:flutter/material.dart';

class AdminDetail extends StatelessWidget {
  final Map product;

  AdminDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product detail'),
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
            child: Text(product['produk'],style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Rp.',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(product['harga'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                // Row(
                //   children: [
                //     Icon(Icons.edit),
                //     Icon(Icons.delete),
                //   ],
                // )
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

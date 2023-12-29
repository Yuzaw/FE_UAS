import 'package:flutter/material.dart';
import 'package:quantum/views/admin_homepage.dart';
import 'package:quantum/Controller/productController.dart';

class EditProduct extends StatelessWidget {
  final Map Product;
  final ProductController productController = ProductController();

  EditProduct({required this.Product});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController..text = Product['produk'],
                  decoration: InputDecoration(labelText: "Nama produk"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kolom tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _kategoriController..text = Product['kategori'],
                  decoration: InputDecoration(labelText: "Kategori"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kolom tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _hargaController
                    ..text = Product['harga'].toString(),
                  decoration: InputDecoration(labelText: "Harga"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kolom tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _deskripsiController..text = Product['deskripsi'],
                  decoration: InputDecoration(labelText: "Deskripsi"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kolom tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _imageController..text = Product['img'],
                  decoration: InputDecoration(labelText: "Image"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kolom tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      productController.updateProduct(Product).then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminHomepage()));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Product berhasil di ubah'),
                        ));
                      });
                    } else {}
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quantum/views/admin_homepage.dart';
import 'package:quantum/Controller/productController.dart';

class AddProduct extends StatelessWidget {
  final ProductController productController = ProductController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  // Future saveProduct() async {
  //   final response =
  //       await http.post(Uri.parse('http://127.0.0.1:8000/api/products'), body: {
  //     'produk': _nameController.text,
  //     'kategori': _kategoriController.text,
  //     'harga': _hargaController.text,
  //     'deskripsi': _deskripsiController.text,
  //     'img': _imageController.text,
  //   });

  //   return json.decode(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
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
                controller: _kategoriController,
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
                controller: _hargaController,
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
                controller: _deskripsiController,
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
                controller: _imageController,
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
                    productController.saveProduct({
                      'produk': _nameController.text,
                      'kategori': _kategoriController.text,
                      'harga': _hargaController.text,
                      'deskripsi': _deskripsiController.text,
                      'img': _imageController.text,
                    }).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminHomepage()));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Product berhasil di tambah'),
                      ));
                    });
                  } else {}
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

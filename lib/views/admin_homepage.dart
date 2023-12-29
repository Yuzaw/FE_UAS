import 'package:flutter/material.dart';
import 'package:quantum/views/add_product.dart';
import 'package:quantum/views/admin_detail.dart';
import 'package:quantum/views/edit_product.dart';
import 'package:quantum/Controller/productController.dart';
import 'package:quantum/views/login_page.dart';

class AdminHomepage extends StatefulWidget {
  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implementasi tampilan hasil pencarian
    return Center(
      child: Text('Hasil Pencarian untuk: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implementasi saran pencarian yang muncul saat pengguna mengetik
    return Center(
      child: Text('Saran Pencarian untuk: $query'),
    );
  }
}

class _AdminHomepageState extends State<AdminHomepage> {
  final ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 126, 126, 126),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddProduct()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(255, 117, 117, 117),
        title: const Text(
          'Quantum',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Tambahkan logika untuk membuka halaman pencarian
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(
              255, 195, 184, 202), // Warna latar belakang DrawerHeader
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                          'assets/img1.png'), // Ganti dengan gambar profil Anda
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      255, 195, 184, 202), // Warna latar belakang DrawerHeader
                ),
              ),
              ListTile(
                title: Text('Account Information',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Card(
                color: Color.fromARGB(0, 0, 0, 0),
                elevation: 5,
                child: ListTile(
                  title: Text('Username: RandomUsername123'),
                ),
              ),
              Card(
                color: Color.fromARGB(0, 0, 0, 0),
                elevation: 5,
                child: ListTile(
                  title: Text('Email: random@example.com'),
                ),
              ),
              Card(
                color: Color.fromARGB(0, 0, 0, 0),
                elevation: 5,
                child: ListTile(
                  title: Text('Password: *********'),
                ),
              ),
              Spacer(), // Spacer untuk mengisi sisa ruang
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: productController.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data['data'];
            if (data is List) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 180,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            height: 120,
                            width: 120,
                            child: Image.network(data[index]['img']),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]['produk'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text('Kategori: '),
                                      Text(data[index]['kategori']),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AdminDetail(
                                                                product:
                                                                    data[index],
                                                              )));
                                                },
                                                child: Icon(Icons.info)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditProduct(
                                                                Product:
                                                                    data[index],
                                                              )));
                                                },
                                                child: Icon(Icons.edit)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Konfirmasi Hapus'),
                                                      content: Text(
                                                          'Apakah Anda yakin ingin menghapus produk ini?'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            // Tindakan ketika tombol "Tidak" ditekan
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Tidak'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            productController
                                                                .deleteProduct(
                                                                    data[index][
                                                                            'id']
                                                                        .toString())
                                                                .then((value) {
                                                              setState(() {});
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                content: Text(
                                                                    'Produk berhasil dihapus'),
                                                              ));
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            });
                                                          },
                                                          child: Text('Ya'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Icon(Icons.delete),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Rp.'),
                                          Text(data[index]['harga'].toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text('Struktur data tidak sesuai');
            }
          } else {
            return Text('Data tidak ada');
          }
        },
      ),
    );
  }
}
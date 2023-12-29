import 'package:flutter/material.dart';
import 'package:quantum/Controller/productController.dart';
import 'package:quantum/views/user_detail.dart';
import 'package:quantum/views/login_page.dart';
import 'package:quantum/views/cart.dart';

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

class UserHomePage extends StatefulWidget {
  @override
  State<UserHomePage> createState() => _ProductListWithoutEditAddState();
}

class _ProductListWithoutEditAddState extends State<UserHomePage> {
  final ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Stack(
                children: [
                  IconButton(
                    onPressed: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    }),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ),
                  // Positioned(
                  //   top: 0,
                  //   right: 3,
                  //   child: Container(
                  //     height: 20,
                  //     width: 20,
                  //     decoration: const BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.red,
                  //     ),
                  //     child: const Center(
                  //       child: Text(
                  //         '2',
                  //         style: TextStyle(
                  //             color: Colors.white, fontWeight: FontWeight.w800),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserDetail(product: data[index])));
                      },
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                            Text('Rp.'),
                                            Text(data[index]['harga']
                                                .toString()),
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

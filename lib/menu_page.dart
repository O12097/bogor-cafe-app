import 'package:bogor_cafe_app/main.dart';
import 'package:bogor_cafe_app/pesanan_page.dart';
import 'package:flutter/material.dart';

class MenuBogorCafePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Bogor Café'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildMenuItemCard('B01', 'Minuman', 'Cappuccino',
              'Paduan kopi arabika dengan buih susu kental dengan gula merah dan putih terpisah', 'Rp 25.000'),
          _buildMenuItemCard('B02', 'Minuman', 'Sparkling Tea',
              'Minuman Teh dari pegunungan Garut dengan tambahan sari melati asli dan gula batu', 'Rp 20.000'),
          _buildMenuItemCard('M01', 'Makanan', 'Batagor',
              'Baso dan Tahu Goreng dengan sajian bumbu kacang dan kecap khas Bandung', 'Rp 35.000'),
          _buildMenuItemCard('M02', 'Makanan', 'Cireng',
              'Makanan ringan berupa tepung kanji goreng, disajikan dengan bumbu kacang pedas', 'Rp 20.000'),
          _buildMenuItemCard('M03', 'Makanan', 'Nasi Goreng Sapi',
              'Nasi goreng ayam yang disajikan dengan telur mata sapi disertai satai ayam', 'Rp 50.000'),
        ],
      ),
            bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pesanan',
          ),
        ],
        selectedItemColor: Colors.brown,
        currentIndex: 0, 
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuBogorCafePage()));
          } else if (index == 2) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PesananPage()));
          } else if (index == 0) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
      ),
    );
  }

  Widget _buildMenuItemCard(String code, String type, String name, String description, String price) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Kode: $code',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Jenis: $type'),
            Text('Nama: $name'),
            Text('Penjelasan: $description'),
            SizedBox(height: 8.0),
            Text(
              'Harga: $price',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

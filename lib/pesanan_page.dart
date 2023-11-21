import 'package:bogor_cafe_app/main.dart';
import 'package:flutter/material.dart';
import 'package:bogor_cafe_app/menu_page.dart';
import 'package:intl/intl.dart';

class PesananPage extends StatefulWidget {
  @override
  _PesananPageState createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  String _selectedKodeMenu = 'B01';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  List<String> _kodeMenuOptions = ['B01', 'B02', 'M01', 'M02', 'M03'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                );
                if (pickedDate != null && pickedDate != _selectedDate) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              child: AbsorbPointer(
                child: TextFormField(
                  readOnly: true,
                  controller: TextEditingController(
                      text: DateFormat('yyyy-MM-dd').format(_selectedDate)),
                  decoration: InputDecoration(labelText: 'Tanggal pemesanan'),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime,
                );
                if (pickedTime != null && pickedTime != _selectedTime) {
                  setState(() {
                    _selectedTime = pickedTime;
                  });
                }
              },
              child: AbsorbPointer(
                child: TextFormField(
                  readOnly: true,
                  controller: TextEditingController(
                      text: _selectedTime.format(context)),
                  decoration: InputDecoration(labelText: 'Waktu pemesanan'),
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              value: _selectedKodeMenu,
              items: _kodeMenuOptions.map((kodeMenu) {
                return DropdownMenuItem(
                  value: kodeMenu,
                  child: Text(kodeMenu),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedKodeMenu = newValue!;
                });
              },
              decoration: InputDecoration(labelText: 'Kode menu'),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                _showSuccessDialog(context);
              },
              child: Text('Pesan Sekarang'),
            ),
          ],
        ),
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
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MenuBogorCafePage()));
          } else if (index == 2) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PesananPage()));
          } else if (index == 0) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pesanan Berhasil!'),
          content: Text(
              'Pesanan Anda pada tanggal ${DateFormat('yyyy-MM-dd').format(_selectedDate)} pukul ${_selectedTime.format(context)} dengan kode menu $_selectedKodeMenu telah diterima. Mohon ditunggu.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen()));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

//docs.google.com/document/d/1hnfKcrbtXiNQ_Jo7vZzD0AvOuJkzaZfvPMnVLBAlLsU/edit?usp=sharingimport 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengelompokan Nilai Siswa',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  String _result = '';

  void _calculateGrade() {
    final input = _controller.text;
    final value = int.tryParse(input);

    if (value == null || value < 0 || value > 100) {
      setState(() {
        _result = 'Nilai tidak valid. Harap masukkan angka antara 0-100.';
      });
      return;
    }

    String grade;
    if (value >= 85) {
      grade = 'A';
    } else if (value >= 70) {
      grade = 'B';
    } else if (value >= 55) {
      grade = 'C';
    } else {
      grade = 'D';
    }

    setState(() {
      _result = 'Kategori: $grade';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengelompokan Nilai Siswa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateGrade,
              child: Text('Hitung'),
            ),
            SizedBox(height: 16.0),
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
     ),
);
}
}

import 'package:flutter/material.dart';
import 'package:project2/pages/LatihasnSoalPages/LatihanSoal10Page.dart';
import 'package:project2/pages/LatihasnSoalPages/LatihanSoalPage1.dart';
import 'package:project2/pages/LatihasnSoalPages/LatihanSoalPage2.dart';
import 'package:project2/pages/LatihasnSoalPages/LatihanSoalPage3.dart';
import 'package:project2/pages/LatihasnSoalPages/LatihanSoalPage4.dart';
import 'package:project2/pages/LatihasnSoalPages/LatihanSoalPage5.dart';
import 'package:project2/pages/LatihasnSoalPages/LatihanSoalPage6.dart';
import 'package:project2/pages/LatihasnSoalPages/LatihanSoalPage7.dart';
import 'package:project2/pages/LatihasnSoalPages/LatihanSoalPage8.dart';
import 'package:project2/pages/LatihasnSoalPages/LatihanSoalPage9.dart';

class LatihanSoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MOBILE LEARNING",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'LATIHAN SOAL',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Akses Semua Latihan Soal Disini!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildSoalButton(
                      'Soal 1', 'Literasi Digital', LatihanSoal1Page()),
                  _buildSoalButton(
                      'Soal 2',
                      'Pemanfaatan AI dengan Literasi Digital',
                      LatihanSoal2Page()),
                  _buildSoalButton(
                      'Soal 3',
                      'Pemanfaatan AI dengan Literasi Digital #2',
                      LatihanSoal3Page()),
                  _buildSoalButton(
                      'Soal 4',
                      'Pengantar Lanjutan Literasi Digital',
                      LatihanSoal4Page()),
                  _buildSoalButton(
                      'Soal 5', 'Literasi Digital #2', LatihanSoal5Page()),
                  _buildSoalButton(
                      'Soal 6',
                      'Critical Thingking dan Literasi Digital',
                      LatihanSoal6Page()),
                  _buildSoalButton(
                      'Soal 7', 'Praktik Literasi Digital', LatihanSoal7Page()),
                  _buildSoalButton(
                      'Soal 8', 'Digital Accesbility', LatihanSoal8Page()),
                  _buildSoalButton(
                      'Soal 9', 'Algoritma Informasi', LatihanSoal9Page()),
                  _buildSoalButton(
                      'Soal 10', 'Google Fact Check', LatihanSoal10Page()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSoalButton(String title, String description, Widget page) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          Icons.assignment,
          color: Colors.teal,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 33, 64, 64),
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 63, 63, 63),
          ),
        ),
        trailing: Builder(
          builder: (BuildContext context) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              child: Text('Kerjakan Soal'),
            );
          },
        ),
      ),
    );
  }
}

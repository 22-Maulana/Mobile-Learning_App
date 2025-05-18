import 'package:flutter/material.dart';
import 'package:project2/pages/TugasPages/Tugas1Page.dart'; // Importing individual task pages
import 'package:project2/pages/TugasPages/Tugas2Page.dart';
import 'package:project2/pages/TugasPages/Tugas3Page.dart';
import 'package:project2/pages/TugasPages/Tugas4Page.dart';
import 'package:project2/pages/TugasPages/Tugas5Page.dart';
import 'package:project2/pages/TugasPages/Tugas6Page.dart';
import 'package:project2/pages/TugasPages/Tugas7Page.dart';
import 'package:project2/pages/TugasPages/Tugas8Page.dart';
import 'package:project2/pages/TugasPages/Tugas9Page.dart';
import 'package:project2/pages/TugasPages/Tugas10Page.dart';

class TugasPage extends StatelessWidget {
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
              'DASHBOARD TUGAS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Akses Semua Tugas Disini!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildTugasButton(
                    'Tugas 1',
                    'Pengenalan Literasi Digital',
                    Tugas1Page(),
                  ),
                  _buildTugasButton(
                    'Tugas 2',
                    'Hubungan AI dengna Literasi Digital',
                    Tugas2Page(),
                  ),
                  _buildTugasButton(
                    'Tugas 3',
                    'Pentingnya Literasi Digital',
                    Tugas3Page(),
                  ),
                  _buildTugasButton(
                    'Tugas 4',
                    'Pengantar Literasi Digital #2',
                    Tugas4Page(),
                  ),
                  _buildTugasButton(
                    'Tugas 5',
                    'Literasi Digital #2',
                    Tugas5Page(),
                  ),
                  _buildTugasButton(
                    'Tugas 6',
                    'Berpikir Kritis',
                    Tugas6Page(),
                  ),
                  _buildTugasButton(
                    'Tugas 7',
                    'Praktik Literasi Digital',
                    Tugas7Page(),
                  ),
                  _buildTugasButton(
                    'Tugas 8',
                    'Aksesbilitas Digital',
                    Tugas8Page(),
                  ),
                  _buildTugasButton(
                    'Tugas 9',
                    'Algoritma Informasi',
                    Tugas9Page(),
                  ),
                  _buildTugasButton(
                    'Tugas 10',
                    'Google Fact Check',
                    Tugas10Page(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTugasButton(String title, String description, Widget page) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          Icons.assignment,
          color: Colors.blue,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 87, 88, 88),
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: const Color.fromARGB(255, 63, 63, 63),
          ),
        ),
        trailing: Builder(
          builder: (BuildContext context) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Gunakan backgroundColor
                foregroundColor: Colors.white, // Gunakan foregroundColor
              ),
              onPressed: () {
                // Navigate to the specific task page using the correct context
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              child: Text('Mengerjakan'),
            );
          },
        ),
      ),
    );
  }
}

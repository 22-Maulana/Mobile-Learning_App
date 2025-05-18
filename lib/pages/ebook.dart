import 'package:flutter/material.dart';
import 'package:project2/pages/EBookPages/EBook10.dart';
import 'package:project2/pages/EBookPages/EBook2.dart';
import 'package:project2/pages/EBookPages/EBook3.dart';
import 'package:project2/pages/EBookPages/EBook4.dart';
import 'package:project2/pages/EBookPages/EBook5.dart';
import 'package:project2/pages/EBookPages/EBook6.dart';
import 'package:project2/pages/EBookPages/EBook7.dart';
import 'package:project2/pages/EBookPages/EBook8.dart';
import 'package:project2/pages/EBookPages/EBook9.dart';
import 'package:project2/pages/EBookPages/Ebook1.dart';

class EbookPage extends StatelessWidget {
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
              'MODUL PEMBELAJARAN',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Akses Semua Summary Disini!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildEBookButton(
                    'E-BOOK 1',
                    'Literasi Digital',
                    Ebook1Page(),
                  ),
                  _buildEBookButton(
                    'E-BOOK 2',
                    'Pemanfaatan AI dengan Literasi Digital',
                    EBook2Page(),
                  ),
                  _buildEBookButton(
                    'E-BOOK 3',
                    'Pemanfaatan AI dengan Literasi Digital #2',
                    Ebook3Page(),
                  ),
                  _buildEBookButton(
                    'E-BOOK 4',
                    'Pengantar Lanjutan Literasi Digital',
                    Ebook4Page(),
                  ),
                  _buildEBookButton(
                    'E-BOOK 5',
                    'Literasi Digital #2',
                    Ebook5Page(),
                  ),
                  _buildEBookButton(
                    'E-BOOK 6',
                    'Critical Thingking dan Literasi Digital',
                    Ebook6Page(),
                  ),
                  _buildEBookButton(
                    'E-BOOK 7',
                    'Praktik Literas Digital',
                    Ebook7Page(),
                  ),
                  _buildEBookButton(
                    'E-BOOK 8',
                    'Assictive Technology and Digital Accessibility',
                    Ebook8Page(),
                  ),
                  _buildEBookButton(
                    'E-BOOK 9',
                    'Algoritma Informasi',
                    Ebook9Page(),
                  ),
                  _buildEBookButton(
                    'E-BOOK 10',
                    'Google Fact Check',
                    Ebook10Page(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEBookButton(String title, String description, Widget page) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
          leading: Icon(
            Icons.book,
            color: Colors.teal,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal[800],
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
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
                  // Navigate to the specific E-Book page using the correct context
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  );
                },
                child: Text('Baca Selengkapnya'),
              );
            },
          )),
    );
  }
}

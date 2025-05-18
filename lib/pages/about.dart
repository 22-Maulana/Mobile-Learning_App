import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "MOBILE LEARNING",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.info_outline,
              size: 100,
              color: Colors.teal,
            ),
            SizedBox(height: 16),
            Text(
              'Tentang Aplikasi',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Platform pembelajaran digital interaktif dan fleksibel.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Aplikasi Mobile Learning ini dirancang sebagai platform pembelajaran digital yang interaktif dan fleksibel. Dilengkapi dengan berbagai fitur unggulan seperti:\n\n'
                  '• Materi pembelajaran dalam bentuk video dan ebook\n'
                  '• Fitur tugas untuk mengerjakan PR langsung dari aplikasi\n'
                  '• Latihan soal untuk memperkuat pemahaman materi\n\n'
                  'Dengan tampilan ramah pengguna dan aksesibilitas tinggi, aplikasi ini menjadi solusi ideal bagi pelajar dan mahasiswa untuk belajar di mana saja dan kapan saja.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                    height: 1.6,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Versi 1.0.0',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 32),
            Divider(thickness: 1),
            SizedBox(height: 8),
            Text(
              '© 2025 MaulanaAP. All rights reserved.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

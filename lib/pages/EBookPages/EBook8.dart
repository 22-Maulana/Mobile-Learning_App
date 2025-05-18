import 'package:flutter/material.dart';

class Ebook8Page extends StatefulWidget {
  @override
  _Ebook8PageState createState() => _Ebook8PageState();
}

class _Ebook8PageState extends State<Ebook8Page> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'Ringkasan Materi 8',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Assistive Technology dan Digital Accessibility',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Ringkasan Materi 8',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: const Text(
                        'Assistive Technology adalah teknologi yang dirancang untuk membantu individu dengan kebutuhan khusus dalam menggunakan perangkat digital dan akses informasi. '
                        'Teknologi ini mencakup alat seperti pembaca layar, perangkat input alternatif, dan software khusus yang mempermudah aktivitas sehari-hari.\n\n'
                        'Digital Accessibility adalah konsep memastikan bahwa semua orang, termasuk penyandang disabilitas, dapat mengakses, memahami, dan menggunakan teknologi digital tanpa hambatan.\n\n'
                        'Penerapan digital accessibility sangat penting agar teknologi dapat digunakan secara inklusif, memperkecil kesenjangan digital, dan memberikan kesempatan yang setara bagi semua pengguna.\n\n'
                        'Dengan mengintegrasikan assistive technology dan prinsip digital accessibility, kita menciptakan lingkungan digital yang ramah, inklusif, dan mudah diakses oleh semua kalangan.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

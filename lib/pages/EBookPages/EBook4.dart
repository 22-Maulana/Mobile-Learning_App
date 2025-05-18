import 'package:flutter/material.dart';

class Ebook4Page extends StatefulWidget {
  @override
  _Ebook4PageState createState() => _Ebook4PageState();
}

class _Ebook4PageState extends State<Ebook4Page> {
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
          'Ringkasan Materi 4',
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
              'Pengantar Literasi Digital (Lanjutan)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Ringkasan Materi 4',
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
                        'Literasi digital merupakan dasar penting bagi masyarakat di era teknologi informasi saat ini. '
                        'Pengantar literasi digital membahas bagaimana individu mengenal dan mulai memahami penggunaan teknologi digital dalam kehidupan sehari-hari.\n\n'
                        'Dalam pengantar ini, kita mempelajari konsep dasar seperti penggunaan internet, media sosial, perangkat digital, serta bagaimana mengelola informasi yang diterima.\n\n'
                        'Pengantar literasi digital juga menekankan pentingnya kesadaran akan keamanan digital, privasi, dan etika dalam berinteraksi di dunia maya.\n\n'
                        'Melalui pengantar ini, diharapkan individu dapat memulai perjalanan untuk menjadi pengguna teknologi yang cerdas dan bertanggung jawab.',
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

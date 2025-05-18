import 'package:flutter/material.dart';

class EBook2Page extends StatefulWidget {
  @override
  _EBook2PageState createState() => _EBook2PageState();
}

class _EBook2PageState extends State<EBook2Page> {
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
          'Ringkasan Materi 2',
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
              'Pemanfaatan AI dalam Literasi Digital',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Ringkasan Materi 2',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Scrollable Card
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
                        'Artificial Intelligence (AI) memiliki peran penting dalam meningkatkan literasi digital. '
                        'AI membantu pengguna memahami, mengelola, dan menggunakan teknologi digital secara lebih efektif dan aman.\n\n'
                        'Beberapa pemanfaatan AI dalam literasi digital antara lain:\n\n'
                        '• Personalisasi pembelajaran digital, sehingga materi dan konten dapat disesuaikan dengan kebutuhan pengguna.\n'
                        '• Deteksi dan penyaringan konten berbahaya seperti hoaks, ujaran kebencian, dan spam menggunakan algoritma AI.\n'
                        '• Asisten virtual dan chatbot yang memudahkan akses informasi dan edukasi secara interaktif.\n'
                        '• Analisis perilaku pengguna untuk memberikan rekomendasi yang tepat serta menjaga keamanan data.\n\n'
                        'Dengan bantuan AI, literasi digital menjadi lebih inklusif, adaptif, dan mendukung pengembangan keterampilan digital yang lebih luas.',
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

            // Tombol Kembali
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

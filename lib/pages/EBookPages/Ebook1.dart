import 'package:flutter/material.dart';

class Ebook1Page extends StatefulWidget {
  @override
  _Ebook1PageState createState() => _Ebook1PageState();
}

class _Ebook1PageState extends State<Ebook1Page> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose(); // Jangan lupa dispose!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'Ringkasan Materi 1',
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
              'Literasi Digital',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Ringkasan Materi 1',
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
                        'Literasi digital adalah kemampuan untuk memahami, menggunakan, mengevaluasi, dan menciptakan informasi melalui teknologi digital. '
                        'Hal ini mencakup berbagai keterampilan seperti mengoperasikan perangkat digital, memahami keamanan siber, berpikir kritis terhadap informasi di internet, dan beretika dalam dunia digital.\n\n'
                        'Dalam dunia yang semakin terhubung secara digital, literasi digital sangat penting agar seseorang dapat:\n\n'
                        '• Mengakses dan menggunakan informasi secara efektif\n'
                        '• Berpartisipasi aktif dalam masyarakat digital\n'
                        '• Melindungi data pribadi dan identitas digital\n'
                        '• Menilai kebenaran dan keandalan informasi di internet\n'
                        '• Menghindari penyebaran hoaks dan disinformasi\n\n'
                        'Literasi digital juga mendukung pembelajaran sepanjang hayat, produktivitas kerja, serta kehidupan sosial yang lebih aman dan sehat di era digital.',
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

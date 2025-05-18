import 'package:flutter/material.dart';

class Ebook6Page extends StatefulWidget {
  @override
  _Ebook6PageState createState() => _Ebook6PageState();
}

class _Ebook6PageState extends State<Ebook6Page> {
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
          'Ringkasan Materi 6',
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
              'Critical Thinking dan Literasi Digital',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Ringkasan Materi 6',
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
                        'Critical thinking atau berpikir kritis merupakan kemampuan penting dalam literasi digital yang membantu kita menilai dan menganalisis informasi secara objektif.\n\n'
                        'Dengan berpikir kritis, pengguna teknologi dapat memilah informasi yang benar dan valid dari yang salah atau menyesatkan, terutama di era digital yang penuh dengan informasi berlimpah.\n\n'
                        'Materi ini menekankan pentingnya mempertanyakan sumber informasi, memahami konteks, dan tidak mudah terpengaruh oleh berita palsu (hoaks) atau bias yang tersebar di media digital.\n\n'
                        'Mengembangkan kemampuan critical thinking dalam literasi digital membuat kita lebih bijak, cerdas, dan bertanggung jawab dalam menggunakan teknologi serta menyebarkan informasi.',
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

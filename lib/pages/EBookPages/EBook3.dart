import 'package:flutter/material.dart';

class Ebook3Page extends StatefulWidget {
  @override
  _Ebook3PageState createState() => _Ebook3PageState();
}

class _Ebook3PageState extends State<Ebook3Page> {
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
                        'Literasi digital adalah kemampuan seseorang untuk mengakses, memahami, menilai, dan menggunakan teknologi digital dengan efektif dan bertanggung jawab. '
                        'Literasi digital meliputi keterampilan teknis serta sikap kritis dalam berinteraksi dengan dunia digital.\n\n'
                        'Menurut UNESCO, literasi digital mencakup penguasaan media digital dan internet untuk mendapatkan, mengevaluasi, dan mengkomunikasikan informasi secara tepat dan efisien.\n\n'
                        'Literasi digital juga berarti memahami risiko keamanan digital seperti perlindungan data pribadi, keamanan siber, dan etika digital.\n\n'
                        'Dengan literasi digital yang baik, individu dapat menjadi pengguna teknologi yang produktif, kreatif, dan bertanggung jawab di era digital.',
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

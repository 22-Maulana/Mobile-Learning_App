import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LatihanSoal4Page extends StatefulWidget {
  @override
  _LatihanSoal4PageState createState() => _LatihanSoal4PageState();
}

class _LatihanSoal4PageState extends State<LatihanSoal4Page> {
  List<int?> _selectedAnswers = List<int?>.filled(5, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. Menurut video, apa definisi "digital" berdasarkan KBBI',
      'options': [
        'Kemampuan untuk memahami dan menggunakan informasi yang berkaitan dengan perangkat komputer.',
        'Kemampuan untuk bersosialisasi, berpikir kritis, kreatif, dan inspiratif.',
        'Segala sesuatu yang berhubungan dengan angka dan penomoran.'
      ],
    },
    {
      'question':
          '2. Menurut video, apa tujuh elemen penting literasi digital?',
      'options': [
        'Budaya, kognitif, konstruktif, komunikatif, kepercayaan diri, kreatif, dan kritis.',
        'Jejaring sosial, transliterasi, manajemen privasi, manajemen identitas, dan membuat konten.',
        'Mengatur dan berbagi konten, menggunakan kembali konten, memfilter dan memilih konten, dan penyiaran diri.',
        'Menghemat waktu, menghemat tenaga, menghemat biaya, kemudahan terhubung dengan orang lain, dan selalu diperbarui dengan informasi terbaru.'
      ],
    },
    {
      'question':
          '3.Menurut Steven Weller (2012), komponen mana yang melibatkan keterampilan dalam memanfaatkan fitur pada aplikasi media sosial?',
      'options': [
        'Transliterasi',
        'jejaring Sosial',
        'Membuat Konten',
        'memfilter dan memilih konten'
      ],
    },
    {
      'question':
          '4. enurut video, apa salah satu manfaat dari literasi digital?',
      'options': [
        'Meningkatkan keterampilan komputer.',
        'Meningkatkan kehadiran media sosial.',
        'Menghemat waktu, tenaga, dan biaya.',
        'Menjadi pembuat konten profesional.'
      ],
    },
    {
      'question': '5. Tugas apa yang diberikan di akhir video?',
      'options': [
        'Membuat video tentang literasi digital.',
        'Menulis jurnal pembelajaran dalam bentuk artikel dan rekaman suara.',
        'Berbagi ide dan ide menarik serta konten multimedia melalui berbagai platform.',
        'Berpartisipasi aktif dalam kegiatan literasi digital.'
      ],
    },
  ];

  Future<void> _saveAnswers() async {
    final prefs = await SharedPreferences.getInstance();

    // Konversi jawaban ke string untuk disimpan
    List<String> jawabanString =
        _selectedAnswers.map((e) => (e ?? -1).toString()).toList();

    await prefs.setStringList('JawabanLatihanSoal', jawabanString);

    // Print hasil jawaban ke terminal (debug console)
    print('Jawaban yang disimpan:');
    for (int i = 0; i < jawabanString.length; i++) {
      String opsi =
          jawabanString[i] == '-1' ? 'Belum dijawab' : jawabanString[i];
      print('Soal ${i + 1}: Opsi $opsi');
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Jawaban berhasil disimpan!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latihan Soal 4',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _questions[index]['question'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[800],
                            ),
                          ),
                          SizedBox(height: 12),
                          ...List<Widget>.generate(
                            _questions[index]['options'].length,
                            (optionIndex) => RadioListTile<int>(
                              title: Text(
                                _questions[index]['options'][optionIndex],
                                style: TextStyle(fontSize: 16),
                              ),
                              value: optionIndex,
                              groupValue: _selectedAnswers[index],
                              activeColor: Colors.teal,
                              onChanged: (value) {
                                setState(() {
                                  _selectedAnswers[index] = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                label: Text(
                  'Simpan Jawaban',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _saveAnswers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

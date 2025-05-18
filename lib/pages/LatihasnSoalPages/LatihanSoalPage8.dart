import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LatihanSoal8Page extends StatefulWidget {
  @override
  _LatihanSoal8PageState createState() => _LatihanSoal8PageState();
}

class _LatihanSoal8PageState extends State<LatihanSoal8Page> {
  List<int?> _selectedAnswers = List<int?>.filled(5, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question':
          '1. Apa fokus utama dari teknologi asistif dan aksesibilitas digital?',
      'options': [
        'Membuat teknologi digital lebih canggih.',
        'Membantu individu dengan disabilitas dan memastikan aksesibilitas konten digital untuk semua.',
        'Mengurangi biaya perangkat digital.'
      ],
    },
    {
      'question':
          '2. Manakah di bawah ini yang merupakan contoh teknologi asistif?',
      'options': [
        'Aplikasi media sosial.',
        'Pembaca layar dan perangkat lunak pengenal suara.',
        'Permainan video dengan grafis tinggi.'
      ],
    },
    {
      'question': '3. Mengapa aksesibilitas digital itu penting?',
      'options': [
        'Agar semua situs web terlihat sama.',
        'Untuk memastikan bahwa semua orang memiliki kesempatan yang sama untuk berpartisipasi dalam dunia digital.',
        'Untuk meningkatkan kecepatan internet untuk semua pengguna.'
      ],
    },
    {
      'question': '4. Prinsip desain apa yang penting dalam aksesibilitas web?',
      'options': [
        'Menggunakan warna-warna cerah dan animasi yang kompleks.',
        'Menyediakan alternatif teks untuk gambar dan memastikan navigasi yang mudah.',
        'Hanya mendukung perangkat terbaru.'
      ],
    },
    {
      'question': '5. Literasi digital yang inklusif mengakui pentingnya...',
      'options': [
        'Hanya fokus pada pengguna teknologi yang mahir.',
        'Memastikan kesempatan yang sama bagi semua orang untuk berpartisipasi dalam dunia digital.',
        'Mengembangkan teknologi hanya untuk kelompok tertentu.'
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
          'Latihan Soal 8',
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

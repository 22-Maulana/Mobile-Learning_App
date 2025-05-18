import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LatihanSoal6Page extends StatefulWidget {
  @override
  _LatihanSoal6PageState createState() => _LatihanSoal6PageState();
}

class _LatihanSoal6PageState extends State<LatihanSoal6Page> {
  List<int?> _selectedAnswers = List<int?>.filled(5, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. pa hubungan utama yang dibahas dalam video ini?',
      'options': [
        'Hubungan antara literasi digital dan kemampuan coding.',
        'Hubungan antara berpikir kritis dan literasi digital.',
        'Hubungan antara media sosial dan literasi digital.'
      ],
    },
    {
      'question':
          '2. Mengapa berpikir kritis penting dalam konteks literasi digital?',
      'options': [
        'Untuk mempercepat proses pencarian informasi.',
        'Untuk mengevaluasi keakuratan dan kredibilitas informasi online.',
        'Untuk meningkatkan kemampuan menggunakan perangkat lunak.'
      ],
    },
    {
      'question':
          '3. Manakah di bawah ini yang merupakan contoh keterampilan berpikir kritis?',
      'options': [
        'Mengikuti tren media sosial terbaru.',
        'Menganalisis bias dalam sebuah artikel berita online.',
        'Mengirim email dengan cepat dan efisien.'
      ],
    },
    {
      'question':
          '4. Apa yang memungkinkan individu dengan literasi digital yang kuat?',
      'options': [
        'Membuat konten viral di internet.',
        'Menggunakan alat dan teknologi digital secara efektif.',
        'Menghindari semua bentuk interaksi digital.'
      ],
    },
    {
      'question':
          '5. Apa yang membekali individu dengan kemampuan untuk memilah informasi yang benar dari yang salah?',
      'options': [
        'Kecepatan internet yang tinggi.',
        'Keterampilan berpikir kritis.',
        'Jumlah teman di media sosial.'
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
          'Latihan Soal 6',
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

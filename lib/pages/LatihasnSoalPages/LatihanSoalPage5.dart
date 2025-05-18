import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LatihanSoal5Page extends StatefulWidget {
  @override
  _LatihanSoal5PageState createState() => _LatihanSoal5PageState();
}

class _LatihanSoal5PageState extends State<LatihanSoal5Page> {
  List<int?> _selectedAnswers = List<int?>.filled(5, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question':
          '1. Menurut video, siapa yang harus menjadi contoh literasi digital?',
      'options': [
        'Guru, orang tua, dan siswa.',
        'Guru, orang tua, siswa, dan staf pendidikan.',
        'Guru dan siswa.',
        'Orang tua dan siswa.'
      ],
    },
    {
      'question':
          '2. Apa salah satu strategi untuk memperkuat literasi digital di sekolah?',
      'options': [
        'Menyediakan lingkungan fisik yang merangsang interaksi digital.',
        'Membatasi interaksi digital pada mata pelajaran tertentu.',
        'Hanya berfokus pada aspek teknis literasi digital.',
        'Tidak menganjurkan interaksi digital untuk mempromosikan pembelajaran tradisional.'
      ],
    },
    {
      'question': '3. Apa yang harus melibatkan pembelajaran literasi digital?',
      'options': [
        'Hanya keterampilan teknis.',
        'Memahami nilai-nilai universal.',
        'Menghafal alat digital',
        'mengindari interaksi dengan lingkungan digital'
      ],
    },
    {
      'question':
          '4. Pola pikir seperti apa yang harus didukung untuk meningkatkan literasi digital?',
      'options': [
        'Keterampilan digital bersifat opsional.',
        'Keterampilan digital hanya untuk individu tertentu.',
        'Keterampilan digital adalah keterampilan dasar untuk semua orang.',
        'Keterampilan digital tidak penting dalam pendidikan.'
      ],
    },
    {
      'question': '5. Di mana literasi digital harus dikembangkan?',
      'options': [
        'Hanya disekolah',
        'Hanya di tempat kerja',
        'Keluarga, sekolah, dan masyarakat.',
        'hanya di lingkungan online'
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
          'Latihan Soal 5',
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

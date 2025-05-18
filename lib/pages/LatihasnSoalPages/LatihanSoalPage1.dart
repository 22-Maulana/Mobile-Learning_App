import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LatihanSoal1Page extends StatefulWidget {
  @override
  _LatihanSoal1PageState createState() => _LatihanSoal1PageState();
}

class _LatihanSoal1PageState extends State<LatihanSoal1Page> {
  List<int?> _selectedAnswers = List<int?>.filled(5, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. Apa yang dimaksud dengan literasi digital',
      'options': [
        'Kemampuan menggunakan komputer.',
        'Kemampuan untuk menemukan, mengevaluasi, menggunakan, dan mengkomunikasikan informasi secara digital.',
        'Kemampuan untuk membuat program komputer.'
      ],
    },
    {
      'question':
          '2. Manakah di bawah ini yang bukan merupakan komponen utama literasi digital?',
      'options': [
        'Kemampuan teknologi.',
        'Keamanan digital.',
        'Kemampuan memasak.'
      ],
    },
    {
      'question':
          '3. Selain kemampuan teknis, literasi digital juga membutuhkan kemampuan...',
      'options': [
        'Menulis',
        'Berbicara di depan umum.',
        'Kritis dalam mengelola dan menggunakan informasi.'
      ],
    },
    {
      'question': '4. Apa manfaat literasi digital?',
      'options': [
        'Meningkatkan kemampuan bermain game.',
        'Memudahkan dalam mencari dan mengelola informasi.',
        'Membuat seseorang menjadi terkenal di media sosial.'
      ],
    },
    {
      'question': '5. Literasi digital penting di era sekarang karena...',
      'options': [
        'Semua orang menggunakan komputer.',
        'Informasi mudah didapatkan.',
        'Kita hidup di era digital yang membutuhkan kemampuan mengelola informasi.'
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
          'Latihan Soal 1',
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

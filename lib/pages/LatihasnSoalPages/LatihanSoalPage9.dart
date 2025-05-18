import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LatihanSoal9Page extends StatefulWidget {
  @override
  _LatihanSoal9PageState createState() => _LatihanSoal9PageState();
}

class _LatihanSoal9PageState extends State<LatihanSoal9Page> {
  List<int?> _selectedAnswers = List<int?>.filled(5, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question':
          '1. Apa yang dimaksud dengan algoritma dalam konteks internet?',
      'options': [
        'Jaringan kabel yang menghubungkan komputer di seluruh dunia.',
        'Serangkaian instruksi yang diikuti komputer untuk memproses informasi.',
        'Bahasa pemrograman yang digunakan untuk membuat situs web.'
      ],
    },
    {
      'question':
          '2. Bagaimana algoritma memengaruhi pengalaman kita di media sosial?',
      'options': [
        'Mereka menentukan kecepatan unggah dan unduh konten.',
        'Mereka memfilter dan memprioritaskan konten yang kita lihat di umpan berita kita.',
        'Mereka mengatur tata letak halaman profil kita.'
      ],
    },
    {
      'question': '3. Di mana saja algoritma digunakan di internet?',
      'options': [
        'Hanya pada mesin pencari.',
        'Pada media sosial, hasil pencarian, rekomendasi video, dan harga online.',
        'Hanya pada situs web berita.'
      ],
    },
    {
      'question': '4. Mengapa penting untuk memahami dasar-dasar algoritma?',
      'options': [
        'Agar kita dapat membuat algoritma sendiri.',
        'Agar kita menjadi pengguna internet yang lebih sadar dan kritis terhadap informasi.',
        'Agar kita dapat menghindari semua iklan online.'
      ],
    },
    {
      'question':
          '5. Apa salah satu contoh bagaimana algoritma memengaruhi kita?',
      'options': [
        'Mereka menentukan warna tema situs web yang kita kunjungi.',
        'Mereka merekomendasikan video yang mungkin menarik bagi kita.',
        'Mereka mengatur ukuran font pada artikel online.'
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
          'Latihan Soal 9',
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

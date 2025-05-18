import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LatihanSoal7Page extends StatefulWidget {
  @override
  _LatihanSoal7PageState createState() => _LatihanSoal7PageState();
}

class _LatihanSoal7PageState extends State<LatihanSoal7Page> {
  List<int?> _selectedAnswers = List<int?>.filled(5, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. Apa fokus utama dari kesejahteraan digital?',
      'options': [
        'Meningkatkan efisiensi penggunaan perangkat digital.',
        'Menjaga keseimbangan antara penggunaan teknologi dan kesehatan mental serta fisik.',
        'Mempelajari semua fitur terbaru dari aplikasi digital.'
      ],
    },
    {
      'question':
          '2. Apa saja dampak negatif dari penggunaan teknologi yang berlebihan terhadap kesehatan mental?',
      'options': [
        'Meningkatkan rasa bahagia dan koneksi sosial.',
        'Kecemasan, depresi, dan FOMO (Fear of Missing Out).',
        'Meningkatkan kualitas tidur.'
      ],
    },
    {
      'question':
          '3. Strategi apa yang dapat membantu meningkatkan kesejahteraan digital?',
      'options': [
        'Menggunakan semua perangkat digital sebelum tidur.',
        'Menetapkan batasan waktu layar dan menciptakan zona bebas teknologi.',
        'Memeriksa notifikasi media sosial setiap saat.'
      ],
    },
    {
      'question':
          '4. Mengapa kesejahteraan digital menjadi aspek penting dari literasi digital yang bertanggung jawab?',
      'options': [
        ' Agar kita dapat menggunakan teknologi selama mungkin.',
        'Agar teknologi digunakan untuk meningkatkan kehidupan, bukan merusaknya.',
        'Agar kita selalu terupdate dengan tren teknologi terbaru.'
      ],
    },
    {
      'question':
          '5. Apa contoh tindakan yang menunjukkan kesejahteraan digital yang baik?',
      'options': [
        'Tidur dengan telepon di samping tempat tidur.',
        'Memprioritaskan interaksi sosial di dunia nyata daripada interaksi online.',
        'Menggunakan media sosial tanpa batasan waktu'
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
          'Latihan Soal 7',
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

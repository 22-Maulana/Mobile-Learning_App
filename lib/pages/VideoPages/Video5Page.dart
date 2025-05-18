import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Video5Page extends StatefulWidget {
  @override
  _Video5PageState createState() => _Video5PageState();
}

class _Video5PageState extends State<Video5Page> {
  late YoutubePlayerController _controller;
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=KkYYxsMiQYY');

    if (videoId == null) {
      print('Invalid YouTube URL');
      return;
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    _loadNote();
  }

  Future<void> _loadNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedNote = prefs.getString('catatanMateri');
    if (savedNote != null) {
      _noteController.text = savedNote;
    }
  }

  Future<void> _saveNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('catatanMateri', _noteController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Catatan berhasil disimpan')),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () => print('Player is ready.'),
        onEnded: (metaData) => print('Video has ended.'),
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Materi 5',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.teal,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  child: player,
                ),

                // Judul
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'Literasi Digital 2',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[800]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),

                // Deskripsi
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Card(
                    color: Colors.grey[100],
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Video ini membahas literasi digital dan kepentingannya. Literasi digital melibatkan pengetahuan dan keterampilan, mendorong guru, orang tua, dan pendidik untuk menjadi contoh literasi digital. Video ini menekankan peningkatan literasi digital siswa, dengan fokus pada dampak positif. Video ini menguraikan strategi untuk memperkuat literasi digital di sekolah, terutama di tingkat dasar: menyediakan lingkungan fisik yang merangsang keterlibatan digital, menumbuhkan lingkungan sosial positif yang mendukung gagasan bahwa keterampilan digital penting bagi semua siswa, menerapkan program sekolah komprehensif yang disesuaikan dengan kelompok siswa yang berbeda, menekankan penalaran dan pemecahan masalah dalam mata pelajaran, mengintegrasikan literasi digital di seluruh kurikulum. Pendidikan literasi digital harus mencakup pemahaman nilai-nilai universal seperti kebebasan berekspresi dan privasi. Mengembangkan literasi digital di keluarga, sekolah, dan masyarakat sangat penting untuk interaksi yang efektif dengan lingkungan seseorang.',
                        style: TextStyle(
                            fontSize: 16, color: Colors.black87, height: 1.4),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),

                // Catatan
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Catatan Materi',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 12),
                          TextField(
                            controller: _noteController,
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintText: 'Tulis catatan Anda di sini...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.all(12),
                            ),
                          ),
                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              onPressed: _saveNote,
                              icon: Icon(
                                Icons.save,
                                color: Colors.white,
                              ),
                              label: Text('Simpan Catatan',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

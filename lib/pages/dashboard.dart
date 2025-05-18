import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ebook.dart';
import 'tugas.dart';
import 'video.dart';
import 'LatihanSoal.dart';
import 'about.dart';
import 'editProfile.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String userName = ''; // Variabel nama pengguna

  // Function to load the saved name from SharedPreferences
  void _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? 'No Name'; // Load the name
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserName(); // Load the user name when the page is opened
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'MOBILE LEARNING',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(height: 12),
            const Text(
              'SELAMAT DATANG',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              userName, // Display the name loaded from SharedPreferences
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  MenuItem(
                    iconPath: 'assets/images/ebook.png',
                    label: 'Video Summary',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EbookPage(),
                        ),
                      );
                      print('Akses E-Book');
                    },
                  ),
                  MenuItem(
                    iconPath: 'assets/images/tugas.png',
                    label: 'Akses Tugas',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TugasPage(),
                        ),
                      );
                      print("Akses Tugas");
                    },
                  ),
                  MenuItem(
                    iconPath: 'assets/images/video.png',
                    label: 'Akses Video',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPage(),
                        ),
                      );
                      print("Akses Video");
                    },
                  ),
                  MenuItem(
                    iconPath: 'assets/images/latihan.png',
                    label: 'Latihan Soal',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LatihanSoalPage(),
                        ),
                      );
                      print("Akses Latihan Soal");
                    },
                  ),
                  MenuItem(
                    iconPath: 'assets/images/about.png',
                    label: 'About Us',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutPage(),
                        ),
                      );
                      print("Akses About Us");
                    },
                  ),
                  MenuItem(
                    iconPath: 'assets/images/edit.png',
                    label: 'Edit Profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(),
                        ),
                      );
                      print("Akses Edit Profile");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal, // background biru
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // radius 5px
      ),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(iconPath),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

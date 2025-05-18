import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view_profile.dart'; // Import ViewProfilePage
import 'dashboard.dart'; // Import DashboardPage, pastikan kamu punya ini

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _nameController = TextEditingController();
  final _nisnController = TextEditingController();
  final _classController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  // Function to save profile data to local storage
  void _saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save the data in local storage
    await prefs.setString('name', _nameController.text);
    await prefs.setString('nisn', _nisnController.text);
    await prefs.setString('class', _classController.text);
    await prefs.setString('address', _addressController.text);
    await prefs.setString('phone', _phoneController.text);

    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile Tersimpan!')),
    );

    // Navigasi ke DashboardPage dan hilangkan halaman EditProfilePage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashboardPage()),
    );
  }

  // Function to load profile data from local storage
  void _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _nisnController.text = prefs.getString('nisn') ?? '';
      _classController.text = prefs.getString('class') ?? '';
      _addressController.text = prefs.getString('address') ?? '';
      _phoneController.text = prefs.getString('phone') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProfile(); // Load the saved profile data when the page is opened
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Agar scroll saat keyboard muncul
      appBar: AppBar(
        title: Text(
          'Profile Editor',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Tetap dari atas
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontal
            children: [
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Edit Identitas Profilmu Disini!',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: _nisnController,
                decoration: InputDecoration(labelText: 'NISN'),
              ),
              TextField(
                controller: _classController,
                decoration: InputDecoration(labelText: 'Kelas'),
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Nomor Telepon'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Simpan'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                        print("Exit app");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Exit'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewProfilePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Lihat Profile'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

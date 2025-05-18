import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewProfilePage extends StatefulWidget {
  @override
  _ViewProfilePageState createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  String _name = '';
  String _nisn = '';
  String _class = '';
  String _address = '';
  String _phone = '';

  // Function to load profile data from local storage
  void _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _name = prefs.getString('name') ?? 'No Name';
      _nisn = prefs.getString('nisn') ?? 'No NISN';
      _class = prefs.getString('class') ?? 'No Class';
      _address = prefs.getString('address') ?? 'No Address';
      _phone = prefs.getString('phone') ?? 'No Phone';
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProfile(); // Load the profile data when the page is opened
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Details',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            )),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Start the content from the top
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            // Center the avatar and text under the AppBar
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Profile Details',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Text('Nama: $_name', style: TextStyle(fontSize: 16)),
            Text('NISN: $_nisn', style: TextStyle(fontSize: 16)),
            Text('Kelas: $_class', style: TextStyle(fontSize: 16)),
            Text('Alamat: $_address', style: TextStyle(fontSize: 16)),
            Text('Nomor Telepon: $_phone', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

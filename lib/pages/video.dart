import 'package:flutter/material.dart';
import 'package:project2/pages/VideoPages/Video1Page.dart';
import 'package:project2/pages/VideoPages/Video2Page.dart';
import 'package:project2/pages/VideoPages/Video3Page.dart';
import 'package:project2/pages/VideoPages/Video4Page.dart';
import 'package:project2/pages/VideoPages/Video5Page.dart';
import 'package:project2/pages/VideoPages/Video6Page.dart';
import 'package:project2/pages/VideoPages/Video7Page.dart';
import 'package:project2/pages/VideoPages/Video8Page.dart';
import 'package:project2/pages/VideoPages/Video9Page.dart';
import 'package:project2/pages/VideoPages/Video10Page.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MOBILE LEARNING",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'DASHBOARD VIDEO',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Akses Semua Video Disini!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildVideoButton(
                    'Video 1',
                    'Apa itu Literas Digital?',
                    Video1Page(),
                  ),
                  _buildVideoButton(
                    'Video 2',
                    'Pemanfaatan AI dalam Literasi Digital',
                    Video2Page(),
                  ),
                  _buildVideoButton(
                    'Video 3',
                    'Apa itu Literasi Digital #2?',
                    Video3Page(),
                  ),
                  _buildVideoButton(
                    'Video 4',
                    'Pengantar Literasi Digital',
                    Video4Page(),
                  ),
                  _buildVideoButton(
                    'Video 5',
                    'Literas Digital #2',
                    Video5Page(),
                  ),
                  _buildVideoButton(
                    'Video 6',
                    'Kritikal Thingking',
                    Video6Page(),
                  ),
                  _buildVideoButton(
                    'Video 7',
                    'Praktik Literasi Digital',
                    Video7Page(),
                  ),
                  _buildVideoButton(
                    'Video 8',
                    'Assictive Technology and Digital Accessibility',
                    Video8Page(),
                  ),
                  _buildVideoButton(
                    'Video 9',
                    'Algoritma Informasi',
                    Video9Page(),
                  ),
                  _buildVideoButton(
                    'Video 10',
                    'Google Fact Check',
                    Video10Page(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoButton(String title, String description, Widget page) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          Icons.play_circle_filled,
          color: Colors.teal,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 33, 64, 64),
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 63, 63, 63),
          ),
        ),
        trailing: Builder(
          builder: (BuildContext context) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              child: Text('Play Video'),
            );
          },
        ),
      ),
    );
  }
}

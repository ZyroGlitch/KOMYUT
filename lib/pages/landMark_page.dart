import 'package:flutter/material.dart';
import 'package:komyut/components/landmarkCard.dart';

import '../components/drawer_navbar.dart';
import 'profile_page.dart';

class LandmarkPage extends StatefulWidget {
  const LandmarkPage({super.key});

  @override
  State<LandmarkPage> createState() => _LandmarkPageState();
}

class _LandmarkPageState extends State<LandmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerNavbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Landmarkcard(
                  image: 'images/landmarks/SanPedro.jpg',
                  name: 'San Pedro Metropolitan Cathedral',
                ),
                SizedBox(height: 16),
                Landmarkcard(
                  image: 'images/landmarks/crocodilePark.jpg',
                  name: 'Davao Crocodile Park',
                ),
                SizedBox(height: 16),
                Landmarkcard(
                  image: 'images/landmarks/chinaTown.jpg',
                  name: 'Mindanao Chinatown in Uyanguren',
                ),
                SizedBox(height: 16),
                Landmarkcard(
                  image: 'images/landmarks/magsaysay.jpg',
                  name: 'Ramon Magsaysay Park',
                ),
                SizedBox(height: 16),
                Landmarkcard(
                  image: 'images/landmarks/peoplePark.jpg',
                  name: 'People’s Park Davao',
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:komyut/login_page.dart';
import 'package:komyut/profilePage_section/changePassword.dart';
import 'package:komyut/profilePage_section/edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              buildCoverImage(),
              Positioned(
                top: 10,
                left: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  onHover: (value) {
                    setState(() {
                      hover = value;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: hover ? Colors.cyanAccent : Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Back',
                        style: TextStyle(
                          color: hover ? Colors.cyanAccent : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: coverHeight - profileHeight / 2,
                child: buildProfileImage(),
              ),
            ],
          ),
          SizedBox(height: 70),

          // Content Section
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              children: [
                Text(
                  'Mark Zuckerburg',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'mark@gmail.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 36),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditPage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Card(
                          color: Colors.orange,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Changepassword(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Card(
                          color: Colors.orange,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.key, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Card(
                          color: Colors.orange,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.logout, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Log out',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final double coverHeight = 250;
  final double profileHeight = 144;

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          'images/cover.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.fill,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        backgroundColor: Colors.white,
        radius: (profileHeight / 2) + 10,
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: AssetImage('images/profile.jpg'),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:komyut/components/drawer_navbar.dart';
import 'package:komyut/components/hotline.dart';

import 'profile_page.dart';

class EmergencyhotlinePage extends StatefulWidget {
  const EmergencyhotlinePage({super.key});

  @override
  State<EmergencyhotlinePage> createState() => _EmergencyhotlinePageState();
}

class _EmergencyhotlinePageState extends State<EmergencyhotlinePage> {
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
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Hotline(
                    backgroundColor: Colors.blueAccent,
                    hotline: 'National Emergency Hotline',
                    number: '911',
                    image: 'images/telephone.png',
                  ),
                  SizedBox(height: 5),
                  Hotline(
                    backgroundColor: Colors.blueAccent,
                    hotline: 'Philippine National Police',
                    number: '117 / 911',
                    image: 'images/pnp.png',
                  ),
                  SizedBox(height: 5),
                  Hotline(
                    backgroundColor: Colors.blueAccent,
                    hotline: 'Bureau of Fire Protection',
                    number: '(02) 8426-0219 / 911',
                    image: 'images/fire-truck.png',
                  ),
                  SizedBox(height: 5),
                  Hotline(
                    backgroundColor: Colors.blueAccent,
                    hotline: 'Department of Health',
                    number: '(02) 8651-7800 local 5003-5004',
                    image: 'images/ambulance.png',
                  ),
                  SizedBox(height: 5),
                  Hotline(
                    backgroundColor: Colors.blueAccent,
                    hotline: 'Metro Manila Development Authority',
                    number: '136',
                    image: 'images/traffic.png',
                  ),
                  SizedBox(height: 5),
                  Hotline(
                    backgroundColor: Colors.blueAccent,
                    hotline: 'Red Cross Philippines',
                    number: '143 / (02) 8790-2300',
                    image: 'images/healthcare.png',
                  ),
                  SizedBox(height: 5),
                  Hotline(
                    backgroundColor: Colors.blueAccent,
                    hotline: 'NDRRMC',
                    number: '(02) 8911-1406',
                    image: 'images/tsunami.png',
                  ),
                  SizedBox(height: 5),
                  Hotline(
                    backgroundColor: Colors.blueAccent,
                    hotline: 'Meralco',
                    number: '16211',
                    image: 'images/electricity.png',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

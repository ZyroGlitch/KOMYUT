import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:komyut/components/drawer_navbar.dart';
import 'package:komyut/components/route_card.dart';
import 'package:komyut/pages/profile_page.dart';
import 'package:komyut/route_page/googleMap_screen.dart';
import 'package:komyut/route_page/route_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchtxt = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: searchtxt,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Search a jeepney route',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: Text(
                          'Search',
                          style: TextStyle(fontSize: 16),
                        ),
                        icon: Icon(Icons.search),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          fixedSize: Size(150, 50),
                        ),
                      ),
                    ),
                  ],
                ),
                // Route Suggestions
                SizedBox(height: 20),
                RouteCard(
                  routeName: 'Bago Aplaya',
                  routeDirection:
                      LatLng(7.0414018074710425, 125.52935128787122),
                ),
                SizedBox(height: 5),
                // RouteCard(routeName: 'Bangkal'),
                // SizedBox(height: 5),
                // RouteCard(routeName: 'Bo.Obrero'),
                // SizedBox(height: 5),
                // RouteCard(routeName: 'Buhangin (via Dacudao)'),
                // SizedBox(height: 5),
                // RouteCard(routeName: 'Buhangin (via JP Laurel)'),
                // SizedBox(height: 5),
                // RouteCard(routeName: 'Bunawan (via Buhangin)'),
                // SizedBox(height: 5),
                // RouteCard(routeName: 'Bunawan (via Sasa)'),
                // SizedBox(height: 5),
                // RouteCard(routeName: 'Calinan'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

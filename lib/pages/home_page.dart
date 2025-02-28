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
                  routeName: 'Matina Aplaya',
                  routeDirection: LatLng(7.0428252846035075, 125.5819558635912),
                  jeepneys: [
                    LatLng(7.06327477333032, 125.5989188107519),
                    LatLng(7.067552404416505, 125.6021786429538),
                  ],
                ),
                SizedBox(height: 5),
                // RouteCard(
                //   routeName: 'Ecoland',
                //   routeDirection: LatLng(7.048872894241014, 125.59570547420532),
                // ),
                // SizedBox(height: 5),
                // RouteCard(
                //   routeName: 'Claveria',
                //   routeDirection: LatLng(7.070159357988616, 125.6114712519623),
                // ),
                // SizedBox(height: 5),
                // RouteCard(
                //   routeName: 'Sta. Ana Ave',
                //   routeDirection:
                //       LatLng(7.0772005174468475, 125.61956608079798),
                // ),
                // SizedBox(height: 5),
                // RouteCard(
                //   routeName: 'Catalunan Pequeno',
                //   routeDirection: LatLng(7.073299197794062, 125.52324846552237),
                // ),
                // SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

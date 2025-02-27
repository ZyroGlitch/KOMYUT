import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../route_page/googleMap_screen.dart';

class RouteCard extends StatelessWidget {
  const RouteCard({
    super.key,
    required this.routeName,
    required this.routeDirection,
  });

  final String routeName;
  final LatLng routeDirection;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GooglemapScreen(
              destinationName: routeName,
              direction: routeDirection,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white54,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/jeep.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 20),
                  Text(
                    routeName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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

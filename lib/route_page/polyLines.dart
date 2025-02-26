import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polylines extends StatefulWidget {
  const Polylines({super.key});

  @override
  State<Polylines> createState() => _PolylinesState();
}

class _PolylinesState extends State<Polylines> {
  LatLng currentLocation = LatLng(7.0657235, 125.5964753); // This is UM Matina

  Set<Marker> marker = {};
  Set<Polyline> polyline = {};

  List<LatLng> pointOnMap = [
    LatLng(7.0657235, 125.5964753), // This is UM Matina
    LatLng(7.063372985350324, 125.59823710697474), // 24/7 Chicken Matina
    LatLng(7.0643942071924775,
        125.60090389123938), // Jasmine Petron Gasoline Station
    LatLng(7.064488217372279, 125.59876120434855), // Arsonaro Boarding House
  ];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < pointOnMap.length; i++) {
      marker.add(
        Marker(
          markerId: MarkerId(
            i.toString(),
          ),
          position: pointOnMap[i],
          infoWindow: InfoWindow(
            title: 'Places around my school.',
            snippet: 'This is the place number #$i',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      setState(() {
        polyline.add(
          Polyline(
            polylineId: PolylineId("ID"),
            color: Colors.green,
            points: pointOnMap,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: false,
      markers: marker,
      polylines: polyline,
      initialCameraPosition: CameraPosition(
        target: currentLocation,
        zoom: 15,
      ),
    );
  }
}

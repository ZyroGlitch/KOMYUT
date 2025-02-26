import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../pages/home_page.dart';

class GooglemapScreen extends StatefulWidget {
  const GooglemapScreen({super.key});

  @override
  State<GooglemapScreen> createState() => _GooglemapScreenState();
}

class _GooglemapScreenState extends State<GooglemapScreen> {
  final LatLng universityOfMindanao =
      LatLng(7.065915145350813, 125.59644310778414);

  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  LatLng currentLocation = LatLng(7.0657235, 125.5964753); // This is UM Matina

  Set<Polyline> polylines = {};

  List<LatLng> pointOnMap = [
    LatLng(7.0657235, 125.5964753), // This is UM Matina
    LatLng(7.063372985350324, 125.59823710697474), // 24/7 Chicken Matina
    LatLng(7.0643942071924775,
        125.60090389123938), // Jasmine Petron Gasoline Station
    LatLng(7.064488217372279, 125.59876120434855), // Arsonaro Boarding House
  ];

  double selectedMarkerDistance = 0.0;

  @override
  void initState() {
    super.initState();

    // This is for polyLines
    for (int i = 0; i < pointOnMap.length; i++) {
      markers.add(
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
          onTap: () {
            updateSelectedMarkerDistance(pointOnMap[i]);
          },
        ),
      );
    }

    setState(() {
      polylines.add(
        Polyline(
          polylineId: PolylineId("ID"),
          color: Colors.green,
          points: pointOnMap,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                GoogleMap(
                  // This is for the current location of the user
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled:
                      false, // Disable the predefined zoom in/out buttons
                  markers: markers,
                  polylines: polylines,
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: universityOfMindanao,
                    zoom: 16,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () async {
                      Position position = await currentPosition();
                      googleMapController.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            zoom: 16,
                            target:
                                LatLng(position.latitude, position.longitude),
                          ),
                        ),
                      );
                      markers.add(Marker(
                        icon: BitmapDescriptor.defaultMarker,
                        markerId: MarkerId('current_location'),
                        position: LatLng(position.latitude, position.longitude),
                        infoWindow: InfoWindow(
                          title: 'My Current Location',
                          snippet: 'This is University of Mindanao.',
                        ),
                      ));
                      setState(() {
                        updateMarkersWithDistance(position);
                      });
                    },
                    child: Icon(
                      Icons.my_location,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.grey,
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gravahan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Distance: ${selectedMarkerDistance.toStringAsFixed(2)} km',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      label: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: Icon(Icons.arrow_back),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 40),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Position> currentPosition() async {
    bool serviceEnable;
    LocationPermission permission;

    // check if the location service are enabled or not
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location service is disabled');
    }
    // check the location permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission is denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission is denied permanently');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  void updateMarkersWithDistance(Position userPosition) {
    markers.clear();
    for (int i = 0; i < pointOnMap.length; i++) {
      double distanceInMeters = Geolocator.distanceBetween(
        userPosition.latitude,
        userPosition.longitude,
        pointOnMap[i].latitude,
        pointOnMap[i].longitude,
      );
      double distanceInKm = distanceInMeters / 1000;

      markers.add(
        Marker(
          markerId: MarkerId(
            i.toString(),
          ),
          position: pointOnMap[i],
          infoWindow: InfoWindow(
            title: 'Places around my school.',
            snippet:
                'This is the place number #$i\nDistance: ${distanceInKm.toStringAsFixed(2)} km',
          ),
          icon: BitmapDescriptor.defaultMarker,
          onTap: () {
            updateSelectedMarkerDistance(pointOnMap[i]);
          },
        ),
      );
    }
    setState(() {});
  }

  void updateSelectedMarkerDistance(LatLng markerPosition) async {
    Position userPosition = await currentPosition();
    double distanceInMeters = Geolocator.distanceBetween(
      userPosition.latitude,
      userPosition.longitude,
      markerPosition.latitude,
      markerPosition.longitude,
    );
    double distanceInKm = distanceInMeters / 1000;

    setState(() {
      selectedMarkerDistance = distanceInKm;
    });
  }
}

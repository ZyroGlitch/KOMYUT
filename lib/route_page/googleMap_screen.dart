import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../pages/home_page.dart';

class GooglemapScreen extends StatefulWidget {
  final String destinationName, fare;
  final LatLng direction;
  final List<LatLng> jeepneys;

  const GooglemapScreen({
    super.key,
    required this.destinationName,
    required this.direction,
    required this.jeepneys,
    required this.fare,
  });

  @override
  State<GooglemapScreen> createState() => _GooglemapScreenState();
}

class _GooglemapScreenState extends State<GooglemapScreen> {
  _GooglemapScreenState();

  final LatLng universityOfMindanao =
      LatLng(7.065915145350813, 125.59644310778414);

  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  LatLng currentLocation = LatLng(7.0657235, 125.5964753); // This is UM Matina
  Set<Polyline> polylines = {};
  List<LatLng> pointOnMap = [];
  double selectedMarkerDistance = 0.0;
  double distanceToDestination = 0.0;

  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    customMarker(); // Load the custom marker
    currentPosition();

    pointOnMap = [
      LatLng(7.0657235, 125.5964753), // UM Matina
      widget.direction, // Dynamic direction
      ...widget.jeepneys, // Jeepneys locations
    ];

    setState(() {
      polylines.add(
        Polyline(
          polylineId: const PolylineId("current_to_destination"),
          color: Colors.green,
          points: [pointOnMap[0], pointOnMap[1]],
        ),
      );

      // polylines.add(
      //   Polyline(
      //     polylineId: const PolylineId("jeepneys"),
      //     color: Colors.orange,
      //     points: pointOnMap.sublist(1),
      //   ),
      // );

      // Add markers
      for (int i = 0; i < pointOnMap.length; i++) {
        BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
        if (i > 1) {
          markerIcon = customIcon; // Use the custom marker for jeepneys
        }

        markers.add(
          Marker(
            markerId: MarkerId(i.toString()),
            position: pointOnMap[i],
            infoWindow: InfoWindow(
              title: i > 1 ? 'Jeepney #$i' : 'Place #$i',
              snippet:
                  i > 1 ? 'This is a jeepney location.' : 'This is a place.',
            ),
            icon: markerIcon,
            onTap: () {
              updateSelectedMarkerDistance(pointOnMap[i]);
            },
          ),
        );
      }
    });

    updateDistanceToDestination();
  }

  void customMarker() async {
    customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'images/jeep32.png', // Path to your custom marker image
    );
    setState(() {}); // Refresh UI after loading marker
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
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
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
                        markerId: const MarkerId('current_location'),
                        position: LatLng(position.latitude, position.longitude),
                        infoWindow: const InfoWindow(
                          title: 'My Current Location',
                          snippet: 'This is University of Mindanao.',
                        ),
                      ));
                      setState(() {
                        updateMarkersWithDistance(position);
                      });
                    },
                    child: const Icon(
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
              color: Colors.orange[100],
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destinationName,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Current Location -> ${widget.destinationName}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Distance: ${distanceToDestination.toStringAsFixed(2)} km',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Fare: ₱${widget.fare}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      label: const Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: const Icon(Icons.arrow_back),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 40),
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

    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location service is disabled');
    }

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

    return await Geolocator.getCurrentPosition();
  }

  void updateMarkersWithDistance(Position userPosition) {
    markers.clear(); // Remove only the previous current location marker

    // Add back the current location marker without changing its InfoWindow
    markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: LatLng(userPosition.latitude, userPosition.longitude),
        infoWindow: const InfoWindow(
          title: 'My Current Location',
          snippet: 'This is University of Mindanao.',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );

    // Add the destination marker with a static InfoWindow
    markers.add(
      Marker(
        markerId: const MarkerId('destination'),
        position: widget.direction,
        infoWindow: InfoWindow(
          title: widget.destinationName,
          snippet: 'Destination location',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );

    // Re-add jeepney markers without modifying their InfoWindow
    for (int i = 0; i < widget.jeepneys.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId('jeepney_$i'),
          position: widget.jeepneys[i],
          infoWindow: InfoWindow(
            title: 'Jeepney #${i + 1}',
            snippet: 'This is a jeepney location.',
          ),
          icon: customIcon,
        ),
      );
    }

    setState(() {});
  }

  void updateSelectedMarkerDistance(LatLng markerPosition) async {
    Position userPosition = await currentPosition();
    double distanceInKm = Geolocator.distanceBetween(
          userPosition.latitude,
          userPosition.longitude,
          markerPosition.latitude,
          markerPosition.longitude,
        ) /
        1000;

    setState(() {
      selectedMarkerDistance = distanceInKm;
    });
  }

  void updateDistanceToDestination() async {
    Position userPosition = await currentPosition();
    double distanceInKm = Geolocator.distanceBetween(
          userPosition.latitude,
          userPosition.longitude,
          widget.direction.latitude,
          widget.direction.longitude,
        ) /
        1000;

    setState(() {
      distanceToDestination = distanceInKm;
    });
  }
}

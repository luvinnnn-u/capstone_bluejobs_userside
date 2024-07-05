import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindOthersPage extends StatefulWidget {
  const FindOthersPage({super.key});

  @override
  State<FindOthersPage> createState() => _FindOthersPageState();
}

class _FindOthersPageState extends State<FindOthersPage> {
  bool isLoading = false;
  Position? currentPosition;
  Set<Marker> markers = {};
  late GoogleMapController mapController;

  // Updated worker data with profile pictures
  final List<Map<String, dynamic>> workers = [
    {'name': 'Worker 1', 'lat': 37.7749, 'lng': -122.4194, 'profilePic': 'assets/images/meanne.jpg'},
    {'name': 'Worker 2', 'lat': 34.0522, 'lng': -118.2437, 'profilePic': 'assets/images/marlo.jpg'},
    {'name': 'Worker 3', 'lat': 36.1699, 'lng': -115.1398, 'profilePic': 'assets/images/another_profile.jpg'},
  ];

  Future<void> _findNearestWorker() async {
    setState(() {
      isLoading = true;
    });

    try {
      currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      double nearestDistance = double.infinity;
      Map<String, dynamic>? nearestWorker;

      for (var worker in workers) {
        double distance = Geolocator.distanceBetween(
          currentPosition!.latitude,
          currentPosition!.longitude,
          worker['lat'],
          worker['lng'],
        );

        if (nearestWorker == null || distance < nearestDistance) {
          nearestDistance = distance;
          nearestWorker = worker;
        }
      }

      if (nearestWorker != null) {
        setState(() {
          markers.add(Marker(
            markerId: MarkerId(nearestWorker!['name'].toString()),
            position: LatLng(nearestWorker['lat'], nearestWorker['lng']),
            infoWindow: InfoWindow(
              title: nearestWorker['name'].toString(),
              snippet: '${(nearestDistance / 1000).toStringAsFixed(2)} km away',
            ),
            icon: BitmapDescriptor.defaultMarker,
          ));
        });

        mapController.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(nearestWorker['lat'], nearestWorker['lng']),
          10,
        ));
      }
    } catch (e) {
      // Handle exception
      print('Error: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Find Others')),
      body: currentPosition != null
          ? GoogleMap(
              onMapCreated: (controller) => mapController = controller,
              initialCameraPosition: CameraPosition(
                target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
                zoom: 10,
              ),
              markers: markers,
            )
          : Center(
              child: isLoading ? CircularProgressIndicator() : ElevatedButton(
                onPressed: _findNearestWorker,
                child: const Text('Find nearest worker near me'),
              ),
            ),
      floatingActionButton: currentPosition != null
          ? FloatingActionButton(
              onPressed: () {
                mapController.animateCamera(
                  CameraUpdate.newLatLng(
                    LatLng(currentPosition!.latitude, currentPosition!.longitude),
                  ),
                );
              },
              child: const Icon(Icons.my_location),
            )
          : null,
    );
  }
}

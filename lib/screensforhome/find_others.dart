// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // class FindOthersPage extends StatefulWidget {
// //   const FindOthersPage({super.key});

// //   @override
// //   State<FindOthersPage> createState() => _FindOthersPageState();
// // }

// // class _FindOthersPageState extends State<FindOthersPage> {
// //   bool isLoading = false;
// //   Position? currentPosition;
// //   Set<Marker> markers = {};
// //   late GoogleMapController mapController;

// //   final List<Map<String, dynamic>> workers = [
// //     {'name': 'Worker 1', 'lat': 37.7749, 'lng': -122.4194, 'profilePic': 'assets/images/meanne.jpg'},
// //     {'name': 'Worker 2', 'lat': 34.0522, 'lng': -118.2437, 'profilePic': 'assets/images/marlo.jpg'},
// //     {'name': 'Worker 3', 'lat': 36.1699, 'lng': -115.1398, 'profilePic': 'assets/images/another_profile.jpg'},
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _checkPermissions();
// //   }

// //   Future<void> _checkPermissions() async {
// //     if (await Permission.location.isGranted) {
// //       _getCurrentLocation();
// //     } else {
// //       PermissionStatus status = await Permission.location.request();
// //       if (status.isGranted) {
// //         _getCurrentLocation();
// //       } else {
// //         // Handle the case when permission is denied
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('Location permission is required to find the nearest worker')),
// //         );
// //       }
// //     }
// //   }

// //   Future<void> _getCurrentLocation() async {
// //     try {
// //       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
// //       setState(() {});
// //     } catch (e) {
// //       // Handle exception
// //       print('Error: $e');
// //     }
// //   }

// //   Future<void> _findNearestWorker() async {
// //     setState(() {
// //       isLoading = true;
// //     });

// //     if (currentPosition == null) {
// //       await _getCurrentLocation();
// //     }

// //     try {
// //       double nearestDistance = double.infinity;
// //       Map<String, dynamic>? nearestWorker;

// //       for (var worker in workers) {
// //         double distance = Geolocator.distanceBetween(
// //           currentPosition!.latitude,
// //           currentPosition!.longitude,
// //           worker['lat'],
// //           worker['lng'],
// //         );

// //         if (nearestWorker == null || distance < nearestDistance) {
// //           nearestDistance = distance;
// //           nearestWorker = worker;
// //         }
// //       }

// //       if (nearestWorker != null) {
// //         setState(() {
// //           markers.add(Marker(
// //             markerId: MarkerId(nearestWorker!['name'].toString()),
// //             position: LatLng(nearestWorker['lat'], nearestWorker['lng']),
// //             infoWindow: InfoWindow(
// //               title: nearestWorker['name'].toString(),
// //               snippet: '${(nearestDistance / 1000).toStringAsFixed(2)} km away',
// //             ),
// //             icon: BitmapDescriptor.defaultMarker,
// //           ));
// //         });

// //         mapController.animateCamera(CameraUpdate.newLatLngZoom(
// //           LatLng(nearestWorker['lat'], nearestWorker['lng']),
// //           10,
// //         ));
// //       }
// //     } catch (e) {
// //       // Handle exception
// //       print('Error: $e');
// //     }

// //     setState(() {
// //       isLoading = false;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Find Others')),
// //       body: currentPosition != null
// //           ? GoogleMap(
// //               onMapCreated: (controller) => mapController = controller,
// //               initialCameraPosition: CameraPosition(
// //                 target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
// //                 zoom: 10,
// //               ),
// //               markers: markers,
// //             )
// //           : Center(
// //               child: isLoading ? CircularProgressIndicator() : ElevatedButton(
// //                 onPressed: _findNearestWorker,
// //                 child: const Text('Find nearest worker near me'),
// //               ),
// //             ),
// //       floatingActionButton: currentPosition != null
// //           ? FloatingActionButton(
// //               onPressed: () {
// //                 mapController.animateCamera(
// //                   CameraUpdate.newLatLng(
// //                     LatLng(currentPosition!.latitude, currentPosition!.longitude),
// //                   ),
// //                 );
// //               },
// //               child: const Icon(Icons.my_location),
// //             )
// //           : null,
// //     );
// //   }
// // }


// //this works already but world map
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';

// // class FindOthersPage extends StatefulWidget {
// //   const FindOthersPage({Key? key}) : super(key: key);

// //   @override
// //   State<FindOthersPage> createState() => _FindOthersPageState();
// // }

// // class _FindOthersPageState extends State<FindOthersPage> {
// //   bool isLoading = false;
// //   Position? currentPosition;
// //   late MapController mapController;
// //   final List<Marker> markers = [];

// //   final List<Map<String, dynamic>> workers = [
// //     {'name': 'Worker 1', 'lat': 37.7749, 'lng': -122.4194, 'profilePic': 'assets/images/meanne.jpg'},
// //     {'name': 'Worker 2', 'lat': 34.0522, 'lng': -118.2437, 'profilePic': 'assets/images/marlo.jpg'},
// //     {'name': 'Worker 3', 'lat': 36.1699, 'lng': -115.1398, 'profilePic': 'assets/images/another_profile.jpg'},
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     mapController = MapController();
// //     _checkPermissions();
// //   }

// //   Future<void> _checkPermissions() async {
// //     if (await Permission.location.isGranted) {
// //       _getCurrentLocation();
// //     } else {
// //       PermissionStatus status = await Permission.location.request();
// //       if (status.isGranted) {
// //         _getCurrentLocation();
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('Location permission is required to find the nearest worker')),
// //         );
// //       }
// //     }
// //   }

// //   Future<void> _getCurrentLocation() async {
// //     try {
// //       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
// //       setState(() {});
// //     } catch (e) {
// //       print('Error: $e');
// //     }
// //   }

// //   Future<void> _findNearestWorker() async {
// //     setState(() {
// //       isLoading = true;
// //     });

// //     if (currentPosition == null) {
// //       await _getCurrentLocation();
// //     }

// //     try {
// //       double nearestDistance = double.infinity;
// //       Map<String, dynamic>? nearestWorker;

// //       for (var worker in workers) {
// //         double distance = Geolocator.distanceBetween(
// //           currentPosition!.latitude,
// //           currentPosition!.longitude,
// //           worker['lat'],
// //           worker['lng'],
// //         );

// //         if (nearestWorker == null || distance < nearestDistance) {
// //           nearestDistance = distance;
// //           nearestWorker = worker;
// //         }
// //       }

// //       if (nearestWorker != null) {
// //         setState(() {
// //           markers.add(Marker(
// //             point: LatLng(nearestWorker?['lat'], nearestWorker?['lng']),
// //             builder: (ctx) => Container(
// //               child: Column(
// //                 children: [
// //                   Text(nearestWorker?['name']),
// //                  // Image.asset(nearestWorker['profilePic'], width: 50, height: 50),
// //                  Image.asset(nearestWorker?['profilePic'] ?? 'default_image_path', width: 50, height: 50),
// //                 ],
// //               ),
// //             ),
// //           ));
// //         });

// //         mapController.move(
// //           LatLng(nearestWorker['lat'], nearestWorker['lng']),
// //           10.0,
// //         );
// //       }
// //     } catch (e) {
// //       print('Error: $e');
// //     }

// //     setState(() {
// //       isLoading = false;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Find Others')),
// //       body: currentPosition != null
// //           ? FlutterMap(
// //               mapController: mapController,
// //               options: MapOptions(
// //                 center: LatLng(currentPosition!.latitude, currentPosition!.longitude),
// //                 zoom: 10.0,
// //               ),
// //               children: [
// //                 TileLayer(
// //                   urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
// //                   subdomains: ['a', 'b', 'c'],
// //                 ),
// //                 MarkerLayer(markers: markers),
// //               ],
// //             )
// //           : Center(
// //               child: isLoading
// //                   ? CircularProgressIndicator()
// //                   : ElevatedButton(
// //                       onPressed: _findNearestWorker,
// //                       child: const Text('Find nearest worker near me'),
// //                     ),
// //             ),
// //       floatingActionButton: currentPosition != null
// //           ? FloatingActionButton(
// //               onPressed: () {
// //                 mapController.move(
// //                   LatLng(currentPosition!.latitude, currentPosition!.longitude),
// //                   10.0,
// //                 );
// //               },
// //               child: const Icon(Icons.my_location),
// //             )
// //           : null,
// //     );
// //   }
// // }



// // //working but map is not zoomable
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';

// // class FindOthersPage extends StatefulWidget {
// //   const FindOthersPage({Key? key}) : super(key: key);

// //   @override
// //   State<FindOthersPage> createState() => _FindOthersPageState();
// // }

// // class _FindOthersPageState extends State<FindOthersPage> {
// //   bool isLoading = false;
// //   Position? currentPosition;
// //   late MapController mapController;
// //   final List<Marker> markers = [];

// //   final List<Map<String, dynamic>> workers = [
// //     {'name': 'Worker 1', 'lat': 13.6315, 'lng': 123.0504, 'profilePic': 'assets/images/meanne.jpg'},
// //     {'name': 'Worker 2', 'lat': 13.1365, 'lng': 123.7228, 'profilePic': 'assets/images/marlo.jpg'},
// //     {'name': 'Worker 3', 'lat': 13.1573, 'lng': 123.7496, 'profilePic': 'assets/images/another_profile.jpg'},
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     mapController = MapController();
// //     _checkPermissions();
// //   }

// //   Future<void> _checkPermissions() async {
// //     if (await Permission.location.isGranted) {
// //       _getCurrentLocation();
// //     } else {
// //       PermissionStatus status = await Permission.location.request();
// //       if (status.isGranted) {
// //         _getCurrentLocation();
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('Location permission is required to find the nearest worker')),
// //         );
// //       }
// //     }
// //   }

// //   Future<void> _getCurrentLocation() async {
// //     try {
// //       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
// //       setState(() {});
// //     } catch (e) {
// //       print('Error: $e');
// //     }
// //   }

// //   Future<void> _findNearestWorker() async {
// //     setState(() {
// //       isLoading = true;
// //     });

// //     if (currentPosition == null) {
// //       await _getCurrentLocation();
// //     }

// //     try {
// //       double nearestDistance = double.infinity;
// //       Map<String, dynamic>? nearestWorker;

// //       for (var worker in workers) {
// //         double distance = Geolocator.distanceBetween(
// //           currentPosition!.latitude,
// //           currentPosition!.longitude,
// //           worker['lat'],
// //           worker['lng'],
// //         );

// //         if (nearestWorker == null || distance < nearestDistance) {
// //           nearestDistance = distance;
// //           nearestWorker = worker;
// //         }
// //       }

// //       setState(() {
// //         markers.clear();
// //         for (var worker in workers) {
// //           markers.add(Marker(
// //             point: LatLng(worker['lat'], worker['lng']),
// //             builder: (ctx) => Container(
// //               child: Column(
// //                 children: [
// //                   Text(worker['name']),
// //                   Image.asset(worker['profilePic'], width: 50, height: 50),
// //                 ],
// //               ),
// //             ),
// //           ));
// //         }

// //         if (nearestWorker != null) {
// //           mapController.move(
// //             LatLng(nearestWorker['lat'], nearestWorker['lng']),
// //             10.0,
// //           );
// //         }
// //       });
// //     } catch (e) {
// //       print('Error: $e');
// //     }

// //     setState(() {
// //       isLoading = false;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Find Others')),
// //       body: currentPosition != null
// //           ? FlutterMap(
// //               mapController: mapController,
// //               options: MapOptions(
// //                 center: LatLng(13.6315, 123.0504), // Bicol Region
// //                 zoom: 8.0,
// //               ),
// //               children: [
// //                 TileLayer(
// //                   urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
// //                   subdomains: ['a', 'b', 'c'],
// //                 ),
// //                 MarkerLayer(markers: markers),
// //               ],
// //             )
// //           : Center(
// //               child: isLoading
// //                   ? CircularProgressIndicator()
// //                   : ElevatedButton(
// //                       onPressed: _findNearestWorker,
// //                       child: const Text('Find nearest worker near me'),
// //                     ),
// //             ),
// //       floatingActionButton: currentPosition != null
// //           ? FloatingActionButton(
// //               onPressed: () {
// //                 mapController.move(
// //                   LatLng(currentPosition!.latitude, currentPosition!.longitude),
// //                   10.0,
// //                 );
// //               },
// //               child: const Icon(Icons.my_location),
// //             )
// //           : null,
// //     );
// //   }
// // }


// // //map is working but kind off confused
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';

// // class FindOthersPage extends StatefulWidget {
// //   const FindOthersPage({Key? key}) : super(key: key);

// //   @override
// //   State<FindOthersPage> createState() => _FindOthersPageState();
// // }

// // class _FindOthersPageState extends State<FindOthersPage> {
// //   bool isLoading = false;
// //   Position? currentPosition;
// //   late MapController mapController;
// //   final List<Marker> markers = [];

// //   final List<Map<String, dynamic>> workers = [
// //     {'name': 'Worker 1', 'lat': 13.6197, 'lng': 123.1944, 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
// //     {'name': 'Worker 2', 'lat': 13.5840, 'lng': 123.0721, 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
// //     {'name': 'Worker 3', 'lat': 13.5765, 'lng': 123.0428, 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     mapController = MapController();
// //     _checkPermissions();
// //   }

// //   Future<void> _checkPermissions() async {
// //     if (await Permission.location.isGranted) {
// //       _getCurrentLocation();
// //     } else {
// //       PermissionStatus status = await Permission.location.request();
// //       if (status.isGranted) {
// //         _getCurrentLocation();
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
// //         );
// //       }
// //     }
// //   }

// //   Future<void> _getCurrentLocation() async {
// //     try {
// //       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
// //       setState(() {});
// //     } catch (e) {
// //       print('Error: $e');
// //     }
// //   }

// //   Future<void> _findNearestWorker() async {
// //     setState(() {
// //       isLoading = true;
// //     });

// //     if (currentPosition == null) {
// //       await _getCurrentLocation();
// //     }

// //     try {
// //       double nearestDistance = double.infinity;
// //       Map<String, dynamic>? nearestWorker;

// //       for (var worker in workers) {
// //         double distance = Geolocator.distanceBetween(
// //           currentPosition!.latitude,
// //           currentPosition!.longitude,
// //           worker['lat'],
// //           worker['lng'],
// //         );

// //         if (nearestWorker == null || distance < nearestDistance) {
// //           nearestDistance = distance;
// //           nearestWorker = worker;
// //         }
// //       }

// //       if (nearestWorker != null) {
// //         setState(() {
// //           markers.add(Marker(
// //             point: LatLng(nearestWorker?['lat'], nearestWorker?['lng']),
// //             builder: (ctx) => Column(
// //               children: [
// //                 CircleAvatar(
// //                   backgroundImage: AssetImage(nearestWorker?['profilePic'] ?? 'default_image_path'),
// //                   radius: 25,
// //                   backgroundColor: Colors.blue,
// //                   child: CircleAvatar(
// //                     backgroundImage: AssetImage(nearestWorker?['profilePic'] ?? 'default_image_path'),
// //                     radius: 23,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 4),
// //                 Text(nearestWorker?['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
// //                 Text(nearestWorker?['place']),
// //                 TextButton(
// //                   onPressed: () {
// //                     // Handle view profile action
// //                   },
// //                   child: const Text('View Profile', style: TextStyle(color: Colors.blue)),
// //                 ),
// //               ],
// //             ),
// //           ));
// //         });

// //         mapController.move(
// //           LatLng(nearestWorker['lat'], nearestWorker['lng']),
// //           10.0,
// //         );
// //       }
// //     } catch (e) {
// //       print('Error: $e');
// //     }

// //     setState(() {
// //       isLoading = false;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Find Others')),
// //       body: currentPosition != null
// //           ? FlutterMap(
// //               mapController: mapController,
// //               options: MapOptions(
// //                 center: LatLng(13.6218, 123.1944),
// //                 zoom: 8.0,
// //                 interactiveFlags: InteractiveFlag.all,
// //               ),
// //               children: [
// //                 TileLayer(
// //                   urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
// //                   subdomains: ['a', 'b', 'c'],
// //                 ),
// //                 MarkerLayer(markers: markers),
// //               ],
// //             )
// //           : Center(
// //               child: isLoading
// //                   ? const CircularProgressIndicator()
// //                   : ElevatedButton(
// //                       onPressed: _findNearestWorker,
// //                       child: const Text('Find nearest worker near me'),
// //                     ),
// //             ),
// //       floatingActionButton: currentPosition != null
// //           ? FloatingActionButton(
// //               onPressed: () {
// //                 mapController.move(
// //                   LatLng(currentPosition!.latitude, currentPosition!.longitude),
// //                   10.0,
// //                 );
// //               },
// //               child: const Icon(Icons.my_location),
// //             )
// //           : null,
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   Position? currentPosition;
//   late MapController mapController;
//   final List<Marker> markers = [];

//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'lat': 13.6197, 'lng': 123.1944, 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'lat': 13.5840, 'lng': 123.0721, 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'lat': 13.5765, 'lng': 123.0428, 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     mapController = MapController();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       _getCurrentLocation();
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         _getCurrentLocation();
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {});
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> _findNearestWorker() async {
//     setState(() {
//       isLoading = true;
//     });

//     if (currentPosition == null) {
//       await _getCurrentLocation();
//     }

//     try {
//       double nearestDistance = double.infinity;
//       Map<String, dynamic>? nearestWorker;

//       for (var worker in workers) {
//         double distance = Geolocator.distanceBetween(
//           currentPosition!.latitude,
//           currentPosition!.longitude,
//           worker['lat'],
//           worker['lng'],
//         );

//         if (nearestWorker == null || distance < nearestDistance) {
//           nearestDistance = distance;
//           nearestWorker = worker;
//         }
//       }

//       if (nearestWorker != null) {
//         setState(() {
//           markers.clear(); // Clear any existing markers
//           markers.add(Marker(
//             point: LatLng(nearestWorker?['lat'], nearestWorker?['lng']),
//             builder: (ctx) => Column(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: AssetImage(nearestWorker?['profilePic'] ?? 'default_image_path'),
//                   radius: 25,
//                   backgroundColor: Colors.blue,
//                   child: CircleAvatar(
//                     backgroundImage: AssetImage(nearestWorker?['profilePic'] ?? 'default_image_path'),
//                     radius: 23,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(nearestWorker?['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
//                 Text(nearestWorker?['place']),
//                 TextButton(
//                   onPressed: () {
//                     // Handle view profile action
//                   },
//                   child: const Text('View Profile', style: TextStyle(color: Colors.blue)),
//                 ),
//               ],
//             ),
//           ));
//         });

//         mapController.move(
//           LatLng(nearestWorker['lat'], nearestWorker['lng']),
//           15.0, // Adjust zoom level to focus on the vicinity
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//     }

//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Find Others')),
//       body: currentPosition != null
//           ? FlutterMap(
//               mapController: mapController,
//               options: MapOptions(
//                 center: LatLng(13.6218, 123.1944),
//                 zoom: 8.0,
//                 interactiveFlags: InteractiveFlag.all,
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   subdomains: ['a', 'b', 'c'],
//                 ),
//                 MarkerLayer(markers: markers),
//               ],
//             )
//           : Center(
//               child: isLoading
//                   ? const CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _findNearestWorker,
//                       child: const Text('Find nearest worker near me'),
//                     ),
//             ),
//       floatingActionButton: currentPosition != null
//           ? FloatingActionButton(
//               onPressed: () {
//                 mapController.move(
//                   LatLng(currentPosition!.latitude, currentPosition!.longitude),
//                   15.0, // Adjust zoom level for user's current position
//                 );
//               },
//               child: const Icon(Icons.my_location),
//             )
//           : null,
//     );
//   }
// }



//map is not going 360 zooms okay
// import 'package:bluejobs_user/screensforhome/messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   Position? currentPosition;
//   late MapController mapController;
//   final List<Marker> markers = [];

//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'lat': 13.6197, 'lng': 123.1944, 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'lat': 13.5840, 'lng': 123.0721, 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'lat': 13.5765, 'lng': 123.0428, 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     mapController = MapController();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       _getCurrentLocation();
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         _getCurrentLocation();
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {});
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> _findNearestWorker() async {
//     setState(() {
//       isLoading = true;
//     });

//     if (currentPosition == null) {
//       await _getCurrentLocation();
//     }

//     try {
//       double nearestDistance = double.infinity;
//       Map<String, dynamic>? nearestWorker;

//       for (var worker in workers) {
//         double distance = Geolocator.distanceBetween(
//           currentPosition!.latitude,
//           currentPosition!.longitude,
//           worker['lat'],
//           worker['lng'],
//         );

//         if (nearestWorker == null || distance < nearestDistance) {
//           nearestDistance = distance;
//           nearestWorker = worker;
//         }
//       }

//       if (nearestWorker != null) {
//         setState(() {
//           markers.clear(); // Clear any existing markers
//           markers.add(Marker(
//             point: LatLng(nearestWorker?['lat'], nearestWorker?['lng']),
//             builder: (ctx) => Column(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: AssetImage(nearestWorker?['profilePic'] ?? 'default_image_path'),
//                   radius: 25,
//                   backgroundColor: Colors.blue,
//                   child: CircleAvatar(
//                     backgroundImage: AssetImage(nearestWorker?['profilePic'] ?? 'default_image_path'),
//                     radius: 23,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(nearestWorker?['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
//                 Text(nearestWorker?['place']),
//                 TextButton(
//                   onPressed: () {
//                     // Handle view profile action
//                   },
//                   child: const Text('View Profile', style: TextStyle(color: Colors.blue)),
//                 ),
//               ],
//             ),
//           ));
//         });

//         mapController.move(
//           LatLng(nearestWorker['lat'], nearestWorker['lng']),
//           15.0, // Adjust zoom level to focus on the vicinity
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//     }

//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       backgroundColor: Color.fromARGB(255, 7, 30, 47),
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
//         onPressed: () => Navigator.of(context).pop(), // Handle the back button press
//       ),
//       title: Text('Find Others', style: CustomTextStyle.semiBoldTextWhite),
//     ),
//       body: currentPosition != null
//           ? FlutterMap(
//               mapController: mapController,
//               options: MapOptions(
//                 center: LatLng(12.8797, 121.7740), // Center map on the Philippines
//                 zoom: 6.0, // Set an appropriate zoom level
//                 interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag, // Disable rotation
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   subdomains: ['a', 'b', 'c'],
//                 ),
//                 MarkerLayer(markers: markers),
//               ],
//             )
//           : Center(
//               child: isLoading
//                   ? const CircularProgressIndicator()
//                   : ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: Colors.orange, // Set text color
//                         minimumSize: const Size(250, 50), // Adjust button size
//                       ),
//                       onPressed: _findNearestWorker,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Icon(Icons.search, color: Colors.white), // Add an icon to the button
//                           SizedBox(width: 10), // Add space between the icon and text
//                           Expanded(
//                             child: Text(
//                               'Find nearest worker near me',
//                               textAlign: TextAlign.center,
//                               softWrap: false, // Prevent text from wrapping
//                               style: TextStyle(fontSize: 16), // Adjust font size if necessary
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//             ),
//       floatingActionButton: currentPosition != null
//           ? FloatingActionButton(
//               onPressed: () {
//                 mapController.move(
//                   LatLng(currentPosition!.latitude, currentPosition!.longitude),
//                   15.0, // Adjust zoom level for user's current position
//                 );
//               },
//               child: const Icon(Icons.my_location),
//             )
//           : null,
//     );
//   }
// }




//works alreadt
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   bool showCards = false;
//   Position? currentPosition;
  
//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       _getCurrentLocation();
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         _getCurrentLocation();
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {}); // Refresh state after getting location
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void _showWorkerCards() {
//     setState(() {
//       showCards = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 7, 30, 47),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text('Find Others', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//       ),
//       body: showCards
//           ? ListView.builder(
//               itemCount: workers.length,
//               itemBuilder: (context, index) {
//                 final worker = workers[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(worker['profilePic']),
//                       radius: 30,
//                     ),
//                     title: Text(worker['name']),
//                     subtitle: Text(worker['place']),
//                     trailing: Wrap(
//                       spacing: 8,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle view resume action
//                           },
//                           child: const Text('View Resume'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle connect action
//                           },
//                           child: const Text('Connect'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle message action
//                           },
//                           child: const Text('Message'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )
//           : Center(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.orange,
//                   minimumSize: const Size(250, 50),
//                 ),
//                 onPressed: _showWorkerCards,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Icon(Icons.search, color: Colors.white),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         'Find workers near me',
//                         textAlign: TextAlign.center,
//                         softWrap: false,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }




//works but design is hideous
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   bool showCards = false;
//   Position? currentPosition;

//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       _getCurrentLocation();
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         _getCurrentLocation();
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {}); // Refresh state after getting location
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void _showWorkerCards() {
//     setState(() {
//       showCards = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appBarColor = const Color.fromARGB(255, 7, 30, 47); // Color same as AppBar

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text('Find Others', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//       ),
//       body: showCards
//           ? ListView.builder(
//               itemCount: workers.length,
//               itemBuilder: (context, index) {
//                 final worker = workers[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   color: appBarColor,
//                   elevation: 4.0,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage(worker['profilePic']),
//                           radius: 30,
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(worker['name'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                               Text(worker['place'], style: const TextStyle(color: Colors.white70)),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         SizedBox(
//                           width: 150, // Set a fixed width for buttons
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     // Handle view resume action
//                                   },
//                                   style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//                                   child: const Text('View Resume', textAlign: TextAlign.center),
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     // Handle connect action
//                                   },
//                                   style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//                                   child: const Text('Connect', textAlign: TextAlign.center),
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     // Handle message action
//                                   },
//                                   style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//                                   child: const Text('Message', textAlign: TextAlign.center),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )
//           : Center(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.orange,
//                   minimumSize: const Size(250, 50),
//                 ),
//                 onPressed: _showWorkerCards,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Icon(Icons.search, color: Colors.white),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         'Find workers near me',
//                         textAlign: TextAlign.center,
//                         softWrap: false,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }




//okay na to
// import 'package:bluejobs_user/styles/responsive_utils.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   bool showCards = false;
//   bool showButton = true;
//   Position? currentPosition;

//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       setState(() {
//         showButton = true; // Show button if permission is granted
//       });
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         setState(() {
//           showButton = true; // Show button if permission is granted after request
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _startLoading() async {
//     setState(() {
//       isLoading = true;
//       showButton = false;
//     });
//     await Future.delayed(const Duration(seconds: 5)); // Simulate loading delay
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         isLoading = false;
//         showCards = true; // Show cards after loading
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appBarColor = const Color.fromARGB(255, 7, 30, 47); // Color same as AppBar

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title:  Text('Find Others', style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),),
//       ),
//       body: showButton
//           ? Center(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   minimumSize: const Size(250, 50),
//                 ),
//                 onPressed: _startLoading,
//                 child :  Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children:  [
//                     Expanded(
//                       child: Text(
//                         'Find workers near me',
//                         textAlign: TextAlign.center,
//                         softWrap: false,
//                         style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           : isLoading
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children:  [
//                       CircularProgressIndicator(color: Colors.white,),
//                       SizedBox(height: 16),
//                       Text('Searching for blue-collar workers near you',  style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),),
//                     ],
//                   ),
//                 )
//               : showCards
//                   ? ListView.builder(
//                       itemCount: workers.length,
//                       itemBuilder: (context, index) {
//                         final worker = workers[index];
//                         return Card(
//                           margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                           color: appBarColor,
//                           elevation: 4.0,
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundImage: AssetImage(worker['profilePic']),
//                                       radius: 30,
//                                     ),
//                                     const SizedBox(width: 16),
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(worker['name'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                                           Text(worker['place'], style: const TextStyle(color: Colors.white70)),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 16), // Space between profile info and buttons
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: ElevatedButton(
//                                         onPressed: () {
//                                           // Handle view resume action
//                                         },
//                                         style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//                                         child: const Text('View Resume', textAlign: TextAlign.center),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                       child: ElevatedButton(
//                                         onPressed: () {
//                                           // Handle connect action
//                                         },
//                                         style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//                                         child: const Text('Connect', textAlign: TextAlign.center),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                       child: ElevatedButton(
//                                         onPressed: () {
//                                           // Handle message action
//                                         },
//                                         style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//                                         child: const Text('Message', textAlign: TextAlign.center),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   : const SizedBox(), // Empty widget if nothing is shown
//     );
//   }
// }



// //goods na to 
// import 'package:bluejobs_user/styles/responsive_utils.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'package:bluejobs_user/styles/custom_button.dart'; // Import your CustomButton

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   bool showCards = false;
//   bool showButton = true;
//   Position? currentPosition;

//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       setState(() {
//         showButton = true; // Show button if permission is granted
//       });
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         setState(() {
//           showButton = true; // Show button if permission is granted after request
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _startLoading() async {
//     setState(() {
//       isLoading = true;
//       showButton = false;
//     });
//     await Future.delayed(const Duration(seconds: 5)); // Simulate loading delay
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         isLoading = false;
//         showCards = true; // Show cards after loading
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appBarColor = const Color.fromARGB(255, 7, 30, 47); // Color same as AppBar

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Find Others',
//           style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0), // Add padding around the entire content
//         child: showButton
//             ? Center(
//                 child: CustomButton(
//                   onTap: _startLoading,
//                   buttonText: 'Find workers near me',
//                   // width: 250,
//                   // height: 50,
//                 ),
//               )
//             : isLoading
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const CircularProgressIndicator(color: Colors.white),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Wait for a few seconds...',
//                           style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),
//                         ),
//                       ],
//                     ),
//                   )
//                 : showCards
//                     ? ListView.builder(
//                         itemCount: workers.length,
//                         itemBuilder: (context, index) {
//                           final worker = workers[index];
//                           return Card(
//                             margin: const EdgeInsets.symmetric(vertical: 8),
//                             color: appBarColor,
//                             elevation: 4.0,
//                             child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       CircleAvatar(
//                                         backgroundImage: AssetImage(worker['profilePic']),
//                                         radius: 30,
//                                       ),
//                                       const SizedBox(width: 16),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                              Text(worker['name'], style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
//                                              Text(worker['place'], style: CustomTextStyle.regularText),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 16), // Space between profile info and buttons
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             // Handle view resume action
//                                           },
//                                           style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 243, 107, 4)),
//                                           child:  Text('View Resume', textAlign: TextAlign.center,  style: CustomTextStyle.regularText),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 8),
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             // Handle message action
//                                           },
//                                           style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255)),
//                                           child: Text('Message', textAlign: TextAlign.center, style: CustomTextStyle.regularText.copyWith(color: Colors.black, ),),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       )
//                     : const SizedBox(), // Empty widget if nothing is shown
//       ),
//     );
//   }
// }





//this is okay but it appears as bottom modal
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:bluejobs_user/styles/custom_button.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   bool showCards = false;
//   bool showButton = true;
//   Position? currentPosition;

//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       setState(() {
//         showButton = true; // Show button if permission is granted
//       });
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         setState(() {
//           showButton = true; // Show button if permission is granted after request
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _startLoading() async {
//     setState(() {
//       isLoading = true;
//       showButton = false;
//     });
//     await Future.delayed(const Duration(seconds: 5)); // Simulate loading delay
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         isLoading = false;
//         showCards = true; // Show cards after loading
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void _showResumeModal(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Card(
//             color: const Color.fromARGB(255, 9, 38, 60),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             elevation: 4.0,
//             margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   buildResumeItem(context, 'Name', 'Mark Angelo Cid'),
//                   buildResumeItem(context, 'Age', '21'),
//                   buildResumeItem(context, 'Contact Number', '09637077358'),
//                   buildResumeItem(context, 'Sex', 'Male'),
//                   buildResumeItem(context, 'Address', 'San Antonio, Tabaco City'),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
//                     child: Text(
//                       'I am mostly good at!',
//                       style: CustomTextStyle.regularText.copyWith(
//                         fontWeight: FontWeight.bold,
//                         fontSize: responsiveSize(context, 0.03),
//                       ),
//                     ),
//                   ),
//                   buildSpecializationChips(['Housecleaning', 'Eating']),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appBarColor = const Color.fromARGB(255, 7, 30, 47); // Color same as AppBar

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Find Others',
//           style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0), // Add padding around the entire content
//         child: showButton
//             ? Center(
//                 child: CustomButton(
//                   onTap: _startLoading,
//                   buttonText: 'Find workers near me',
//                 ),
//               )
//             : isLoading
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const CircularProgressIndicator(color: Colors.white),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Wait for a few seconds...',
//                           style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),
//                         ),
//                       ],
//                     ),
//                   )
//                 : showCards
//                     ? ListView.builder(
//                         itemCount: workers.length,
//                         itemBuilder: (context, index) {
//                           final worker = workers[index];
//                           return Card(
//                             margin: const EdgeInsets.symmetric(vertical: 8),
//                             color: appBarColor,
//                             elevation: 4.0,
//                             child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       CircleAvatar(
//                                         backgroundImage: AssetImage(worker['profilePic']),
//                                         radius: 30,
//                                       ),
//                                       const SizedBox(width: 16),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text(worker['name'], style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
//                                             Text(worker['place'], style: CustomTextStyle.regularText),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 16), // Space between profile info and buttons
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             // Handle view resume action
//                                           },
//                                           onLongPress: () {
//                                             _showResumeModal(context);
//                                           },
//                                           style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 243, 107, 4)),
//                                           child: Text('View Resume', textAlign: TextAlign.center, style: CustomTextStyle.regularText),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 8),
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             // Handle message action
//                                           },
//                                           style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
//                                           child: Text(
//                                             'Message',
//                                             textAlign: TextAlign.center,
//                                             style: CustomTextStyle.regularText.copyWith(
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       )
//                     : const SizedBox(), // Empty widget if nothing is shown
//       ),
//     );
//   }

//   Widget buildResumeItem(BuildContext context, String title, String content) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: '$title: ',
//               style: CustomTextStyle.regularText.copyWith(
//                 fontWeight: FontWeight.bold,
//                 fontSize: responsiveSize(context, 0.04),
//               ),
//             ),
//             TextSpan(
//               text: content,
//               style: CustomTextStyle.regularText.copyWith(
//                 fontSize: responsiveSize(context, 0.03),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSpecializationChips(List<String> specializations) {
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 4.0,
//       children: specializations.map((specialization) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4.0),
//           child: Chip(
//             backgroundColor: const Color.fromARGB(255, 243, 107, 4),
//             label: Text(
//               specialization,
//               style: CustomTextStyle.regularText.copyWith(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }




//goodshit may inaadd akong x and swipe  right function 
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:bluejobs_user/styles/custom_button.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   bool showCards = false;
//   bool showButton = true;
//   Position? currentPosition;

//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       setState(() {
//         showButton = true; // Show button if permission is granted
//       });
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         setState(() {
//           showButton = true; // Show button if permission is granted after request
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _startLoading() async {
//     setState(() {
//       isLoading = true;
//       showButton = false;
//     });
//     await Future.delayed(const Duration(seconds: 5)); // Simulate loading delay
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         isLoading = false;
//         showCards = true; // Show cards after loading
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void _showResumeModal(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor:  Color.fromARGB(255, 7, 30, 47),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 buildResumeItem(context, 'Name', 'Mark Angelo Cid'),
//                 buildResumeItem(context, 'Age', '21'),
//                 buildResumeItem(context, 'Contact Number', '09637077358'),
//                 buildResumeItem(context, 'Sex', 'Male'),
//                 buildResumeItem(context, 'Address', 'San Antonio, Tabaco City'),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
//                   child: Text(
//                     'I am mostly good at!',
//                     style: CustomTextStyle.regularText.copyWith(
//                       fontWeight: FontWeight.bold,
//                       fontSize: responsiveSize(context, 0.03),
//                     ),
//                   ),
//                 ),
//                 buildSpecializationChips(['Housecleaning', 'Eating']),
//                 const SizedBox(height: 20),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text('Close'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appBarColor = const Color.fromARGB(255, 7, 30, 47); // Color same as AppBar

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Find Others',
//           style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0), // Add padding around the entire content
//         child: showButton
//             ? Center(
//                 child: CustomButton(
//                   onTap: _startLoading,
//                   buttonText: 'Find workers near me',
//                 ),
//               )
//             : isLoading
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const CircularProgressIndicator(color: Colors.white),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Wait for a few seconds...',
//                           style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),
//                         ),
//                       ],
//                     ),
//                   )
//                 : showCards
//                     ? ListView.builder(
//                         itemCount: workers.length,
//                         itemBuilder: (context, index) {
//                           final worker = workers[index];
//                           return Card(
//                             margin: const EdgeInsets.symmetric(vertical: 8),
//                             color: appBarColor,
//                             elevation: 4.0,
//                             child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       CircleAvatar(
//                                         backgroundImage: AssetImage(worker['profilePic']),
//                                         radius: 30,
//                                       ),
//                                       const SizedBox(width: 16),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text(worker['name'], style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
//                                             Text(worker['place'], style: CustomTextStyle.regularText),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 16), // Space between profile info and buttons
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             // Handle view resume action
//                                           },
//                                           onLongPress: () {
//                                             _showResumeModal(context);
//                                           },
//                                           style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 243, 107, 4)),
//                                           child: Text('View Resume', textAlign: TextAlign.center, style: CustomTextStyle.regularText),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 8),
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             // Handle message action
//                                           },
//                                           style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
//                                           child: Text(
//                                             'Message',
//                                             textAlign: TextAlign.center,
//                                             style: CustomTextStyle.regularText.copyWith(
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       )
//                     : const SizedBox(), // Empty widget if nothing is shown
//       ),
//     );
//   }

//   Widget buildResumeItem(BuildContext context, String title, String content) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: '$title: ',
//               style: CustomTextStyle.regularText.copyWith(
//                 fontWeight: FontWeight.bold,
//                 fontSize: responsiveSize(context, 0.04),
//               ),
//             ),
//             TextSpan(
//               text: content,
//               style: CustomTextStyle.regularText.copyWith(
//                 fontSize: responsiveSize(context, 0.03),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSpecializationChips(List<String> specializations) {
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 4.0,
//       children: specializations.map((specialization) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4.0),
//           child: Chip(
//             backgroundColor: const Color.fromARGB(255, 243, 107, 4),
//             label: Text(
//               specialization,
//               style: CustomTextStyle.regularText.copyWith(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }




//goodshit
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:bluejobs_user/styles/custom_button.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   bool showCards = false;
//   bool showButton = true;
//   Position? currentPosition;

//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       setState(() {
//         showButton = true; // Show button if permission is granted
//       });
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         setState(() {
//           showButton = true; // Show button if permission is granted after request
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _startLoading() async {
//     setState(() {
//       isLoading = true;
//       showButton = false;
//     });
//     await Future.delayed(const Duration(seconds: 5)); // Simulate loading delay
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         isLoading = false;
//         showCards = true; // Show cards after loading
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void _showResumeModal(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: const Color.fromARGB(255, 7, 30, 47),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//           child: Dismissible(
//             direction: DismissDirection.endToStart,
//             key: const Key('resume_modal'),
//             onDismissed: (_) => Navigator.of(context).pop(),
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Resume Details',
//                         style: CustomTextStyle.semiBoldText.copyWith(
//                           fontSize: responsiveSize(context, 0.04),
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.close, color: Colors.white),
//                         onPressed: () => Navigator.of(context).pop(),
//                       ),
//                     ],
//                   ),
//                   buildResumeItem(context, 'Name', 'Mark Angelo Cid'),
//                   buildResumeItem(context, 'Age', '21'),
//                   buildResumeItem(context, 'Contact Number', '09637077358'),
//                   buildResumeItem(context, 'Sex', 'Male'),
//                   buildResumeItem(context, 'Address', 'San Antonio, Tabaco City'),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
//                     child: Text(
//                       'I am mostly good at!',
//                       style: CustomTextStyle.regularText.copyWith(
//                         fontWeight: FontWeight.bold,
//                         fontSize: responsiveSize(context, 0.03),
//                       ),
//                     ),
//                   ),
//                   buildSpecializationChips(['Housecleaning', 'Eating']),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appBarColor = const Color.fromARGB(255, 7, 30, 47); // Color same as AppBar

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Find Others',
//           style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0), // Add padding around the entire content
//         child: showButton
//             ? Center(
//                 child: CustomButton(
//                   onTap: _startLoading,
//                   buttonText: 'Find workers near me',
//                 ),
//               )
//             : isLoading
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const CircularProgressIndicator(color: Colors.white),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Wait for a few seconds...',
//                           style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),
//                         ),
//                       ],
//                     ),
//                   )
//                 : showCards
//                     ? ListView.builder(
//                         itemCount: workers.length,
//                         itemBuilder: (context, index) {
//                           final worker = workers[index];
//                           return Card(
//                             margin: const EdgeInsets.symmetric(vertical: 8),
//                             color: appBarColor,
//                             elevation: 4.0,
//                             child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       CircleAvatar(
//                                         backgroundImage: AssetImage(worker['profilePic']),
//                                         radius: 30,
//                                       ),
//                                       const SizedBox(width: 16),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text(worker['name'], style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
//                                             Text(worker['place'], style: CustomTextStyle.regularText),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 16), // Space between profile info and buttons
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             // Handle view resume action
//                                           },
//                                           onLongPress: () {
//                                             _showResumeModal(context);
//                                           },
//                                           style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 243, 107, 4)),
//                                           child: Text('View Resume', textAlign: TextAlign.center, style: CustomTextStyle.regularText),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 8),
//                                       Expanded(
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             // Handle message action
//                                           },
//                                           style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
//                                           child: Text(
//                                             'Message',
//                                             textAlign: TextAlign.center,
//                                             style: CustomTextStyle.regularText.copyWith(
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       )
//                     : const SizedBox(), // Empty widget if nothing is shown
//       ),
//     );
//   }

//   Widget buildResumeItem(BuildContext context, String title, String content) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: '$title: ',
//               style: CustomTextStyle.regularText.copyWith(
//                 fontWeight: FontWeight.bold,
//                 fontSize: responsiveSize(context, 0.04),
//               ),
//             ),
//             TextSpan(
//               text: content,
//               style: CustomTextStyle.regularText.copyWith(
//                 fontSize: responsiveSize(context, 0.03),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSpecializationChips(List<String> specializations) {
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 4.0,
//       children: specializations.map((specialization) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4.0),
//           child: Chip(
//             backgroundColor: const Color.fromARGB(255, 243, 107, 4),
//             label: Text(
//               specialization,
//               style: CustomTextStyle.regularText.copyWith(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }




//super goods
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:bluejobs_user/styles/custom_button.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   bool showCards = false;
//   bool showButton = true;
//   Position? currentPosition;

//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       setState(() {
//         showButton = true; // Show button if permission is granted
//       });
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         setState(() {
//           showButton = true; // Show button if permission is granted after request
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _startLoading() async {
//     setState(() {
//       isLoading = true;
//       showButton = false;
//     });
//     await Future.delayed(const Duration(seconds: 5)); // Simulate loading delay
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         isLoading = false;
//         showCards = true; // Show cards after loading
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void _showResumeModal(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Color.fromARGB(255, 7, 30, 47),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//           child: GestureDetector(
//             onHorizontalDragUpdate: (details) {
//               // Detect horizontal swipe to close dialog
//               if (details.primaryDelta! > 10) {
//                 Navigator.of(context).pop();
//               }
//             },
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             buildResumeItem(context, 'Name', 'Mark Angelo Cid'),
//                             buildResumeItem(context, 'Age', '21'),
//                             buildResumeItem(context, 'Contact Number', '09637077358'),
//                             buildResumeItem(context, 'Sex', 'Male'),
//                             buildResumeItem(context, 'Address', 'San Antonio, Tabaco City'),
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
//                               child: Text(
//                                 'I am mostly good at!',
//                                 style: CustomTextStyle.regularText.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: responsiveSize(context, 0.03),
//                                 ),
//                               ),
//                             ),
//                             buildSpecializationChips(['Housecleaning', 'Eating']),
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       right: 10,
//                       top: 10,
//                       child: IconButton(
//                         icon: const Icon(Icons.close, color: Colors.white),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appBarColor = const Color.fromARGB(255, 7, 30, 47); // Color same as AppBar

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Find Others',
//           style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0), // Add padding around the entire content
//         child: showButton
//             ? Center(
//                 child: CustomButton(
//                   onTap: _startLoading,
//                   buttonText: 'Find workers near me',
//                 ),
//               )
//             : isLoading
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const CircularProgressIndicator(color: Colors.white),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Wait for a few seconds...',
//                           style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),
//                         ),
//                       ],
//                     ),
//                   )
//                 : showCards
//                     ? Column(
//                         children: [
//                           Expanded(
//                             child: ListView.builder(
//                               itemCount: workers.length,
//                               itemBuilder: (context, index) {
//                                 final worker = workers[index];
//                                 return Card(
//                                   margin: const EdgeInsets.symmetric(vertical: 8),
//                                   color: appBarColor,
//                                   elevation: 4.0,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(16.0),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             CircleAvatar(
//                                               backgroundImage: AssetImage(worker['profilePic']),
//                                               radius: 30,
//                                             ),
//                                             const SizedBox(width: 16),
//                                             Expanded(
//                                               child: Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(worker['name'], style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
//                                                   Text(worker['place'], style: CustomTextStyle.regularText),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 16), // Space between profile info and buttons
//                                         Row(
//                                           children: [
//                                             Expanded(
//                                               child: ElevatedButton(
//                                                 onPressed: () {
//                                                   // Handle view resume action
//                                                 },
//                                                 onLongPress: () {
//                                                   _showResumeModal(context);
//                                                 },
//                                                 style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 243, 107, 4)),
//                                                 child: Text('View Resume', textAlign: TextAlign.center, style: CustomTextStyle.regularText),
//                                               ),
//                                             ),
//                                             const SizedBox(width: 8),
//                                             Expanded(
//                                               child: ElevatedButton(
//                                                 onPressed: () {
//                                                   // Handle message action
//                                                 },
//                                                 style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
//                                                 child: Text(
//                                                   'Message',
//                                                   textAlign: TextAlign.center,
//                                                   style: CustomTextStyle.regularText.copyWith(
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           Text(
//                             'Above are the results, Take note that it can only reach up to 10kms of searching',
//                             style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.03)),
//                           ),
//                         ],
//                       )
//                     : const SizedBox(), // Empty widget if nothing is shown
//       ),
//     );
//   }

//   Widget buildResumeItem(BuildContext context, String title, String content) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: '$title: ',
//               style: CustomTextStyle.regularText.copyWith(
//                 fontWeight: FontWeight.bold,
//                 fontSize: responsiveSize(context, 0.04),
//               ),
//             ),
//             TextSpan(
//               text: content,
//               style: CustomTextStyle.regularText.copyWith(
//                 fontSize: responsiveSize(context, 0.03),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSpecializationChips(List<String> specializations) {
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 4.0,
//       children: specializations.map((specialization) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4.0),
//           child: Chip(
//             backgroundColor: const Color.fromARGB(255, 243, 107, 4),
//             label: Text(
//               specialization,
//               style: CustomTextStyle.regularText.copyWith(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }





// //goodshit na!!
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:bluejobs_user/styles/custom_button.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   bool showCards = false;
//   bool showButton = true;
//   Position? currentPosition;

//   final List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       setState(() {
//         showButton = true; // Show button if permission is granted
//       });
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         setState(() {
//           showButton = true; // Show button if permission is granted after request
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _startLoading() async {
//     setState(() {
//       isLoading = true;
//       showButton = false;
//     });
//     await Future.delayed(const Duration(seconds: 5)); // Simulate loading delay
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         isLoading = false;
//         showCards = true; // Show cards after loading
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void _showResumeModal(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Color.fromARGB(255, 7, 30, 47),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//           child: GestureDetector(
//             onHorizontalDragUpdate: (details) {
//               // Detect horizontal swipe to close dialog
//               if (details.primaryDelta! > 10) {
//                 Navigator.of(context).pop();
//               }
//             },
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             buildResumeItem(context, 'Name', 'Mark Angelo Cid'),
//                             buildResumeItem(context, 'Age', '21'),
//                             buildResumeItem(context, 'Contact Number', '09637077358'),
//                             buildResumeItem(context, 'Sex', 'Male'),
//                             buildResumeItem(context, 'Address', 'San Antonio, Tabaco City'),
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
//                               child: Text(
//                                 'I am mostly good at!',
//                                 style: CustomTextStyle.regularText.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: responsiveSize(context, 0.03),
//                                 ),
//                               ),
//                             ),
//                             buildSpecializationChips(['Housecleaning', 'Eating']),
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       right: 10,
//                       top: 10,
//                       child: IconButton(
//                         icon: const Icon(Icons.close, color: Colors.white),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appBarColor = const Color.fromARGB(255, 7, 30, 47); // Color same as AppBar

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Find Others',
//           style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),
//         ),
//       ),
//       body: showButton
//           ? Center(
//               child: CustomButton(
//                 onTap: _startLoading,
//                 buttonText: 'Find workers near me',
//               ),
//             )
//           : isLoading
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const CircularProgressIndicator(color: Colors.white),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Wait for a few seconds...',
//                         style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),
//                       ),
//                     ],
//                   ),
//                 )
//               : showCards
//                   ? CustomScrollView(
//                       slivers: [
//                         SliverAppBar(
//                           backgroundColor: appBarColor,
//                           pinned: true,
//                           expandedHeight: 60.0,
//                           flexibleSpace: FlexibleSpaceBar(
//                             title: Text(
//                               'Here are the workers near you',
//                               style: CustomTextStyle.regularText.copyWith(color: Colors.white),
//                             ),
//                             titlePadding: const EdgeInsets.all(16),
//                             collapseMode: CollapseMode.pin,
//                           ),
//                         ),
//                         SliverList(
//                           delegate: SliverChildBuilderDelegate(
//                             (context, index) {
//                               final worker = workers[index];
//                               return Card(
//                                 margin: const EdgeInsets.symmetric(vertical: 8),
//                                 color: appBarColor,
//                                 elevation: 4.0,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           CircleAvatar(
//                                             backgroundImage: AssetImage(worker['profilePic']),
//                                             radius: 30,
//                                           ),
//                                           const SizedBox(width: 16),
//                                           Expanded(
//                                             child: Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(worker['name'], style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
//                                                 Text(worker['place'], style: CustomTextStyle.regularText),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 16), // Space between profile info and buttons
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                             child: ElevatedButton(
//                                               onPressed: () {
//                                                 // Handle view resume action
//                                               },
//                                               onLongPress: () {
//                                                 _showResumeModal(context);
//                                               },
//                                               style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 243, 107, 4)),
//                                               child: Text('View Resume', textAlign: TextAlign.center, style: CustomTextStyle.regularText),
//                                             ),
//                                           ),
//                                           const SizedBox(width: 8),
//                                           Expanded(
//                                             child: ElevatedButton(
//                                               onPressed: () {
//                                                 // Handle message action
//                                               },
//                                               style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
//                                               child: Text(
//                                                 'Message',
//                                                 textAlign: TextAlign.center,
//                                                 style: CustomTextStyle.regularText.copyWith(
//                                                   color: Colors.black,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                             childCount: workers.length,
//                           ),
//                         ),
//                         SliverToBoxAdapter(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Text(
//                               'Above are the results, Take note that it can only reach up to 10kms of searching',
//                               style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   : const SizedBox(), // Empty widget if nothing is shown
//     );
//   }

//   Widget buildResumeItem(BuildContext context, String title, String content) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: '$title: ',
//               style: CustomTextStyle.regularText.copyWith(
//                 fontWeight: FontWeight.bold,
//                 fontSize: responsiveSize(context, 0.03),
//               ),
//             ),
//             TextSpan(
//               text: content,
//               style: CustomTextStyle.regularText.copyWith(
//                 fontSize: responsiveSize(context, 0.03),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSpecializationChips(List<String> specializations) {
//     return Wrap(
//       spacing: 8.0,
//       children: specializations.map((specialization) {
//         return Chip(
//           label: Text(specialization),
//           backgroundColor: const Color.fromARGB(255, 243, 107, 4),
//           labelStyle: CustomTextStyle.regularText.copyWith(color: Colors.white),
//         );
//       }).toList(),
//     );
//   }
// }




//goods na sana kaso yung x di ako satisfied
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:bluejobs_user/styles/custom_button.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';

// class FindOthersPage extends StatefulWidget {
//   const FindOthersPage({Key? key}) : super(key: key);

//   @override
//   State<FindOthersPage> createState() => _FindOthersPageState();
// }

// class _FindOthersPageState extends State<FindOthersPage> {
//   bool isLoading = false;
//   bool showCards = false;
//   bool showButton = true;
//   Position? currentPosition;

//   List<Map<String, dynamic>> workers = [
//     {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
//     {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
//     {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     if (await Permission.location.isGranted) {
//       setState(() {
//         showButton = true; // Show button if permission is granted
//       });
//     } else {
//       PermissionStatus status = await Permission.location.request();
//       if (status.isGranted) {
//         setState(() {
//           showButton = true; // Show button if permission is granted after request
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permission is required to find the nearest worker')),
//         );
//       }
//     }
//   }

//   Future<void> _startLoading() async {
//     setState(() {
//       isLoading = true;
//       showButton = false;
//     });
//     await Future.delayed(const Duration(seconds: 5)); // Simulate loading delay
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         isLoading = false;
//         showCards = true; // Show cards after loading
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void _showResumeModal(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Color.fromARGB(255, 7, 30, 47),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//           child: GestureDetector(
//             onHorizontalDragUpdate: (details) {
//               // Detect horizontal swipe to close dialog
//               if (details.primaryDelta! > 10) {
//                 Navigator.of(context).pop();
//               }
//             },
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             buildResumeItem(context, 'Name', 'Mark Angelo Cid'),
//                             buildResumeItem(context, 'Age', '21'),
//                             buildResumeItem(context, 'Contact Number', '09637077358'),
//                             buildResumeItem(context, 'Sex', 'Male'),
//                             buildResumeItem(context, 'Address', 'San Antonio, Tabaco City'),
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
//                               child: Text(
//                                 'I am mostly good at!',
//                                 style: CustomTextStyle.regularText.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: responsiveSize(context, 0.03),
//                                 ),
//                               ),
//                             ),
//                             buildSpecializationChips(['Housecleaning', 'Eating']),
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       right: 10,
//                       top: 10,
//                       child: IconButton(
//                         icon: const Icon(Icons.close, color: Colors.white),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _removeWorker(int index) {
//     setState(() {
//       workers.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appBarColor = const Color.fromARGB(255, 7, 30, 47); // Color same as AppBar

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Find Others',
//           style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),
//         ),
//       ),
//       body: showButton
//           ? Center(
//               child: CustomButton(
//                 onTap: _startLoading,
//                 buttonText: 'Find workers near me',
//               ),
//             )
//           : isLoading
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const CircularProgressIndicator(color: Colors.white),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Wait for a few seconds...',
//                         style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),
//                       ),
//                     ],
//                   ),
//                 )
//               : showCards
//                   ? CustomScrollView(
//                       slivers: [
//                         SliverAppBar(
//                           backgroundColor: appBarColor,
//                           pinned: true,
//                           expandedHeight: 60.0,
//                           flexibleSpace: FlexibleSpaceBar(
//                             title: Text(
//                               'Here are the workers near you',
//                               style: CustomTextStyle.regularText.copyWith(color: Colors.white),
//                             ),
//                             titlePadding: const EdgeInsets.all(16),
//                             collapseMode: CollapseMode.pin,
//                           ),
//                         ),
//                         SliverList(
//                           delegate: SliverChildBuilderDelegate(
//                             (context, index) {
//                               final worker = workers[index];
//                               return Card(
//                                 margin: const EdgeInsets.symmetric(vertical: 8),
//                                 color: appBarColor,
//                                 elevation: 4.0,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Stack(
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               CircleAvatar(
//                                                 backgroundImage: AssetImage(worker['profilePic']),
//                                                 radius: 30,
//                                               ),
//                                               const SizedBox(width: 16),
//                                               Expanded(
//                                                 child: Column(
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text(worker['name'], style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
//                                                     Row(
//                                                       children: [
//                                                         Icon(Icons.location_on, color: Colors.white, size: 16),
//                                                         const SizedBox(width: 4),
//                                                         Text(worker['place'], style: CustomTextStyle.regularText),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(height: 16), // Space between profile info and buttons
//                                           Row(
//                                             children: [
//                                               Expanded(
//                                                 child: ElevatedButton.icon(
//                                                   onPressed: () {
//                                                     // Handle view resume action
//                                                   },
//                                                   onLongPress: () {
//                                                     _showResumeModal(context);
//                                                   },
//                                                   icon: Icon(Icons.remove_red_eye, color: Colors.white),
//                                                   label: Text('View Resume', textAlign: TextAlign.center, style: CustomTextStyle.regularText),
//                                                   style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 243, 107, 4)),
//                                                 ),
//                                               ),
//                                               const SizedBox(width: 8),
//                                               Expanded(
//                                                 child: ElevatedButton.icon(
//                                                   onPressed: () {
//                                                     // Handle message action
//                                                   },
//                                                   icon: Icon(Icons.message_outlined, color: Colors.black),
//                                                   label: Text(
//                                                     'Message',
//                                                     textAlign: TextAlign.center,
//                                                     style: CustomTextStyle.regularText.copyWith(color: Colors.black),
//                                                   ),
//                                                   style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       Positioned(
//                                         right: 10,
//                                         top: 10,
//                                         child: IconButton(
//                                           icon: const Icon(Icons.close, color: Colors.white),
//                                           onPressed: () {
//                                             _removeWorker(index);
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                             childCount: workers.length,
//                           ),
//                         ),
//                         SliverToBoxAdapter(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Text(
//                               'Above are the results, Take note that it can only reach up to 10kms of searching',
//                               style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.03)),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   : const SizedBox(), // Empty widget if nothing is shown
//     );
//   }

//   Widget buildResumeItem(BuildContext context, String title, String content) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: '$title: ',
//               style: CustomTextStyle.regularText.copyWith(
//                 fontWeight: FontWeight.bold,
//                 fontSize: responsiveSize(context, 0.03),
//               ),
//             ),
//             TextSpan(
//               text: content,
//               style: CustomTextStyle.regularText.copyWith(
//                 fontSize: responsiveSize(context, 0.03),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSpecializationChips(List<String> specializations) {
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 4.0,
//       children: specializations.map((specialization) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4.0),
//           child: Chip(
//             backgroundColor: const Color.fromARGB(255, 243, 107, 4),
//             label: Text(
//               specialization,
//               style: CustomTextStyle.regularText.copyWith(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bluejobs_user/styles/custom_button.dart';
import 'package:bluejobs_user/styles/responsive_utils.dart';
import 'package:bluejobs_user/styles/textstyle.dart';

class FindOthersPage extends StatefulWidget {
  const FindOthersPage({Key? key}) : super(key: key);

  @override
  State<FindOthersPage> createState() => _FindOthersPageState();
}

class _FindOthersPageState extends State<FindOthersPage> {
  bool isLoading = false;
  bool showCards = false;
  bool showButton = true;
  Position? currentPosition;

  List<Map<String, dynamic>> workers = [
    {'name': 'Worker 1', 'profilePic': 'assets/images/meanne.jpg', 'place': 'Naga'},
    {'name': 'Worker 2', 'profilePic': 'assets/images/marlo.jpg', 'place': 'Legazpi'},
    {'name': 'Worker 3', 'profilePic': 'assets/images/another_profile.jpg', 'place': 'Sorsogon'},
  ];

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    if (await Permission.location.isGranted) {
      setState(() {
        showButton = true; // Show button if permission is granted
      });
    } else {
      PermissionStatus status = await Permission.location.request();
      if (status.isGranted) {
        setState(() {
          showButton = true; // Show button if permission is granted after request
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permission is required to find the nearest worker')),
        );
      }
    }
  }

  Future<void> _startLoading() async {
    setState(() {
      isLoading = true;
      showButton = false;
    });
    await Future.delayed(const Duration(seconds: 5)); // Simulate loading delay
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        isLoading = false;
        showCards = true; // Show cards after loading
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void _showResumeModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color.fromARGB(255, 7, 30, 47),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              // Detect horizontal swipe to close dialog
              if (details.primaryDelta! > 10) {
                Navigator.of(context).pop();
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildResumeItem(context, 'Name', 'Mark Angelo Cid'),
                            buildResumeItem(context, 'Age', '21'),
                            buildResumeItem(context, 'Contact Number', '09637077358'),
                            buildResumeItem(context, 'Sex', 'Male'),
                            buildResumeItem(context, 'Address', 'San Antonio, Tabaco City'),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
                              child: Text(
                                'I am mostly good at!',
                                style: CustomTextStyle.regularText.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: responsiveSize(context, 0.03),
                                ),
                              ),
                            ),
                            buildSpecializationChips(['Housecleaning', 'Eating']),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  void _removeWorker(int index) {
    setState(() {
      workers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBarColor = const Color.fromARGB(255, 7, 30, 47); // Color same as AppBar

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Find Others',
          style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),
        ),
      ),

      // body: showButton
      //     ? Center(
      //         child: CustomButton(
      //           onTap: _startLoading,
      //           buttonText: 'Find workers near me',
      //         ),
      //       )
      body: showButton
    ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the horizontal padding as needed
        child: Column(
          children: [
            const SizedBox(height: 120), // This creates the space below the AppBar
            Center(
              child: CustomButton(
                onTap: _startLoading,
                buttonText: 'Find workers near me',
              ),
            ),
          ],
        ),
      )
          // : isLoading
          //     ? Center(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             const CircularProgressIndicator(color: Colors.white),
          //             const SizedBox(height: 16),
          //             Text(
          //               'Wait for a few seconds...',
          //               style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),
          //             ),
          //           ],
          //         ),
          //       )
          : isLoading
    ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust the horizontal padding as needed
        child: Column(
          children: [
            const SizedBox(height: 120), // This creates the space below the AppBar
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(color: Colors.white),
                  const SizedBox(height: 16),
                  Text(
                    'Wait for a few seconds...',
                    style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04)),)
                ],
              ),
            ),
          ],
        ),

      )
              : showCards
                  ? CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor: appBarColor,
                          pinned: true,
                          expandedHeight: 60.0,
                          flexibleSpace: FlexibleSpaceBar(
                            title: Text(
                              'Here are the workers near you',
                              style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.03)),
                            ),
                            titlePadding: const EdgeInsets.all(13),
                            collapseMode: CollapseMode.pin,
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Space from sides
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final worker = workers[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  color: appBarColor,
                                  elevation: 4.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(worker['profilePic']),
                                                  radius: 30,
                                                ),
                                                const SizedBox(width: 16),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(worker['name'], style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
                                                      Row(
                                                        children: [
                                                          Icon(Icons.location_on, color: Colors.white, size: 16),
                                                          const SizedBox(width: 4),
                                                          Text(worker['place'], style: CustomTextStyle.regularText),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16), // Space between profile info and buttons
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton.icon(
                                                    onPressed: () {
                                                      // Handle view resume action
                                                    },
                                                    onLongPress: () {
                                                      _showResumeModal(context);
                                                    },
                                                    icon: Icon(Icons.remove_red_eye, color: Colors.white),
                                                    label: Text('See Resume', textAlign: TextAlign.center, style: CustomTextStyle.regularText),
                                                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 243, 107, 4)),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: ElevatedButton.icon(
                                                    onPressed: () {
                                                      // Handle message action
                                                    },
                                                    icon: Icon(Icons.message, color: Colors.black),
                                                    label: Text(
                                                      'Message',
                                                      textAlign: TextAlign.center,
                                                      style: CustomTextStyle.regularText.copyWith(color: Colors.black),
                                                    ),
                                                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          right: 10,
                                          top: 10,
                                          child: IconButton(
                                            icon: const Icon(Icons.close, color: Colors.white),
                                            onPressed: () {
                                              _removeWorker(index);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              childCount: workers.length,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Above are the results, Take note that it can only reach up to 10kms of searching',
                              style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.03)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(), // Empty widget if nothing is shown
    );
  }

  Widget buildResumeItem(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title: ',
              style: CustomTextStyle.regularText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: responsiveSize(context, 0.03),
              ),
            ),
            TextSpan(
              text: content,
              style: CustomTextStyle.regularText.copyWith(
                fontSize: responsiveSize(context, 0.03),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecializationChips(List<String> specializations) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: specializations.map((specialization) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Chip(
            backgroundColor: const Color.fromARGB(255, 243, 107, 4),
            label: Text(
              specialization,
              style: CustomTextStyle.regularText.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

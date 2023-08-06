import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scotremovals/res/colors.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng startlatlng = const LatLng(31.5497, 74.3436);
  LatLng destlatlng = const LatLng(33.6844, 73.0479);

  Completer<GoogleMapController> _controller = Completer();
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};
  @override
  void initState() {
    super.initState();
    _getPolylines();
    _addMarkers();
  }

  late BitmapDescriptor customIcon;

  void _createCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
          size:
              Size(48, 48)), // Adjust the size to match your icon's dimensions
      'assets/icon.png',
    ).then((icon) {
      setState(() {
        customIcon = icon;
      });
    });
  }

  void _addMarkers() {
    _markers.add(Marker(
      icon: customIcon,
      markerId: const MarkerId('start'),
      position: startlatlng,
      infoWindow: const InfoWindow(title: 'Start'),
    ));

    _markers.add(Marker(
      markerId: const MarkerId('dest'),
      position: destlatlng,
      infoWindow: const InfoWindow(title: 'Destination'),
    ));
  }

  // Function to fetch polylines (routes) between Lahore and Islamabad
  Future<void> _getPolylines() async {
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyC4QfSfNEEmdiT9Jrh5xjmqczEN8CAg4Os",
      PointLatLng(startlatlng.latitude, startlatlng.longitude),
      PointLatLng(destlatlng.latitude, destlatlng.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    setState(() {
      _polylines.add(
        Polyline(
          width: 4,
          polylineId: const PolylineId('route1'),
          color: BC.blue,
          points: polylineCoordinates,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route between Lahore and Islamabad'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _markers,
        initialCameraPosition: CameraPosition(target: startlatlng, zoom: 12),
        polylines: _polylines,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   Completer<GoogleMapController> mapController = Completer();
//   Set<Marker> _markers = {};
//   Set<Polyline> _polylines = {};
//
//   final LatLng _startLatLng = const LatLng(
//       33.6844, 73.0479); // Replace with your start location's LatLng
//   final LatLng _destLatLng = const LatLng(
//       31.5204, 74.3587); // Replace with your destination location's LatLng
//   @override
//   void initState() {
//     super.initState();
//     _addMarkers();
//     _getPolyline();
//   }
//
//   var bbody;
//   void _addMarkers() {
//     _markers.add(Marker(
//       markerId: const MarkerId('start'),
//       position: _startLatLng,
//       infoWindow: const InfoWindow(title: 'Start'),
//     ));
//
//     _markers.add(Marker(
//       markerId: const MarkerId('dest'),
//       position: _destLatLng,
//       infoWindow: const InfoWindow(title: 'Destination'),
//     ));
//   }
//
//   void _getPolyline() async {
//     // Make a request to Google Directions API to get the route between the two locations
//     // Replace 'YOUR_API_KEY' with your actual Google Maps API Key
//     String apiKey = 'AIzaSyC4QfSfNEEmdiT9Jrh5xjmqczEN8CAg4Os';
//     String url =
//         'https://maps.googleapis.com/maps/api/directions/json?origin=${_startLatLng.latitude},${_startLatLng.longitude}&destination=${_destLatLng.latitude},${_destLatLng.longitude}&key=$apiKey'
//         '';
//     dynamic body = await http.get(Uri.parse(url));
//     var data = jsonDecode(body.body);
//     print('hyyyy');
//     print('hyyyy');
//     print('hyyyy');
//     print('hyyyy');
//     print('hyyyy');
//     print(data);
//     print('hyyyy');
//     print('hyyyy');
//     print('hyyyy');
//     print('hyyyy');
//     print('hyyyy');
//     // Make your HTTP request to fetch the polyline data
//     // You can use any HTTP package like 'http' or 'dio'
//     // Once you have the data, parse it and create the polyline
//     // For simplicity, we'll assume you have the data and the polyline points in 'polylinePoints' list
//     // Sample Polyline: List<LatLng> polylinePoints = [LatLng(37.7749, -122.4194), LatLng(34.0522, -118.2437)];
//
//     List<LatLng> polylinePoints = [
//       _startLatLng,
//       _destLatLng,
//       // Add your polyline points here
//     ];
//
//     setState(() {
//       _polylines.add(Polyline(
//         polylineId: const PolylineId('route'),
//         points: polylinePoints,
//         color: Colors.blue,
//         width: 5,
//       ));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Google Maps Route'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 onTap: () async {
//                   print('object');
//                   String apiKey = 'AIzaSyC4QfSfNEEmdiT9Jrh5xjmqczEN8CAg4Os';
//                   String url =
//                       'https://maps.googleapis.com/maps/api/directions/json?origin=${_startLatLng.latitude},${_startLatLng.longitude}&destination=${_destLatLng.latitude},${_destLatLng.longitude}&key=$apiKey'
//                       '';
//                   dynamic body = await http.get(Uri.parse(url));
//                   bbody = jsonDecode(body.body);
//                   print(bbody);
//                 },
//                 child: Center(
//                   child: Container(
//                     child: Text('Button'),
//                   ),
//                 ),
//               ),
//               Text(bbody['routes'][0]['bounds'].toString())
//             ],
//           ),
//         )
//         // GoogleMap(
//         //   initialCameraPosition: CameraPosition(
//         //     target: _startLatLng,
//         //     zoom: 10,
//         //   ),
//         //   markers: _markers,
//         //   polylines: _polylines,
//         //   onMapCreated: (GoogleMapController controller) {
//         //     mapController.complete(controller);
//         //     _getPolyline();
//         //   },
//         // ),
//         );
//   }
// }

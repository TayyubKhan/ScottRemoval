import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final double startLat = 51.5072178;
  final double startLng = -0.1275862;
  final double destLat = 55.864237;
  final double destLng = 4.251806;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  List<LatLng> _routeCoords = [];

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId('start'),
        position: LatLng(startLat, startLng),
        infoWindow: InfoWindow(title: 'Starting Location'),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('dest'),
        position: LatLng(destLat, destLng),
        infoWindow: InfoWindow(title: 'Destination'),
      ),
    );
    _getRouteCoords();
  }

  void _getRouteCoords() async {
    // Make API call to get route coordinates
    // This example uses the Google Maps Directions API

    // Construct the URL for the API call
    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${startLat},${startLng}&destination=${destLat},${destLng}&key=AIzaSyDVhiVLwbhFVV2I6mNZf8kqScTjffv4eR0';

    // Make the API call and parse the response
    // This example uses the http package
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);
    List<LatLng> coords = [];
    data['routes'][0]['legs'][0]['steps'].forEach((step) {
      coords.add(
          LatLng(step['end_location']['lat'], step['end_location']['lng']));
    });
    setState(() {
      _routeCoords = coords;
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialPosition = CameraPosition(
      target: LatLng(startLat, startLng),
      zoom: 10,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _markers,
        polylines: {
          Polyline(
            polylineId: PolylineId('route'),
            points: _routeCoords,
            color: Colors.blue,
            width: 5,
          ),
        },
        initialCameraPosition: initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

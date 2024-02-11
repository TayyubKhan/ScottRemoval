import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../res/colors.dart';

class GoogleMapViewModel with ChangeNotifier {
  Set<Polyline> _polylines = {};
  Set<Polyline> get polylines => _polylines;
  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;
  bool isfetched = false;
  LatLng _startlatlng = const LatLng(0, 0);
  LatLng _destlatlng = const LatLng(0, 0);
  LatLng get startlatlng => _startlatlng;
  LatLng get destlatlng => _destlatlng;
  late BitmapDescriptor customIcon;
  Future<void> _createCustomMarkerIcon() async {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
          size:
              Size(20, 20)), // Adjust the size to match your icon's dimensions
      'assets/icon.png',
    ).then((icon) {
      customIcon = icon;
    });
  }

  Future<void> _addMarkers() async {
    await _createCustomMarkerIcon();
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
    notifyListeners();
  }

  Future<void> _addPolylines() async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();
      List<LatLng> polylineCoordinates = [];
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyC4QfSfNEEmdiT9Jrh5xjmqczEN8CAg4Os",
        PointLatLng(_startlatlng.latitude, _startlatlng.longitude),
        PointLatLng(_destlatlng.latitude, _destlatlng.longitude),
        travelMode: TravelMode.driving,
      );
      if (result.points.isNotEmpty) {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }
      }

      _polylines.clear(); // Clear existing polylines
      _polylines.add(
        Polyline(
          width: 4,
          polylineId: const PolylineId('route1'),
          color: BC.blue,
          points: polylineCoordinates,
        ),
      );

      notifyListeners(); // Notify listeners after adding polylines
    } catch (e) {
      print("Error fetching polylines: $e");
      _polylines.clear(); // Clear polylines in case of an error
      notifyListeners(); // Notify listeners even in case of an error
    }
  }

  Set<Polyline> getPolylines() {
    if (isfetched == true) {
      return _polylines;
    } else {
      _addPolylines();
      _addMarkers();
      isfetched = true;
      return _polylines;
    }
  }

  void getLng(LatLng start, LatLng end) {
    try {
      _startlatlng = start;
      _destlatlng = end;
    } catch (e) {
      _startlatlng = const LatLng(0.00, 0.00);
      _destlatlng = const LatLng(0.00, 0.00);
    }
  }
}

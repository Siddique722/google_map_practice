import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class PolygonMapScreen extends StatefulWidget {
  @override
  _PolygonMapScreenState createState() => _PolygonMapScreenState();
}

class _PolygonMapScreenState extends State<PolygonMapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = LatLng(33.6844, 73.0479); // Islamabad Center

  // Islamabad City Polygon Coordinates
  final Set<Polygon> _polygons = {
    Polygon(
      polygonId: PolygonId('islamabad_polygon'),
      points: [
        LatLng(33.7500, 72.9000), // Top Left
        LatLng(33.7500, 73.2000), // Top Right
        LatLng(33.6000, 73.2000), // Bottom Right
        LatLng(33.6000, 72.9000), // Bottom Left
      ],
      strokeWidth: 3,
      strokeColor: Colors.blue,
      fillColor: Colors.blue.withOpacity(0.3), // Transparent Fill
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Islamabad Polygon on Map")),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        polygons: _polygons,
      ),
    );
  }
}

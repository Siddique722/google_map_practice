import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkerInfoWindow extends StatefulWidget {
  const CustomMarkerInfoWindow({Key? key}) : super(key: key);

  @override
  State<CustomMarkerInfoWindow> createState() => _CustomMarkerInfoWindowState();
}

class _CustomMarkerInfoWindowState extends State<CustomMarkerInfoWindow> {
  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  final Completer<GoogleMapController> _mapController = Completer();

  final List<String> images = [
    'image/1.png',
    'image/2.png',
    'image/3.png',
    'image/4.png',
  ];
List<String> restaurantImages=[
  'image/1.png',
  'image/2.png',
  'image/3.png',
  'image/4.png',
];
  List<Marker> markers = [];

  // Coordinates of major Pakistani cities
  final List<LatLng> coordinates = [
    const LatLng(24.8607, 67.0011), // Karachi
    const LatLng(31.5204, 74.3587), // Lahore
    const LatLng(33.6844, 73.0479), // Islamabad
    const LatLng(34.0151, 71.5249), // Peshawar
  ];

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(30.3753, 69.3451), // Roughly center of Pakistan
    zoom: 5.5,
  );

  @override
  void initState() {
    super.initState();
    loadData();
  }
List<String> phone=[
  '123',
  '456',
  '789',
  '987'


];
  /// Loads custom markers with custom icons and info windows
  Future<void> loadData() async {
    try {
      final List<Marker> tempMarkers = [];

      for (int i = 0; i < images.length && i < coordinates.length; i++) {
        final Uint8List? markerIcon = await getBytesFromAssets(images[i], 100);

        if (markerIcon != null) {
          tempMarkers.add(
            Marker(
              markerId: MarkerId(i.toString()),
              position: coordinates[i],
              icon: BitmapDescriptor.fromBytes(markerIcon),
              onTap: () {
                _customInfoWindowController.addInfoWindow!(
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          images[i],
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getCityName(i),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(phone[i].toString(),
                          //"Lat: ${coordinates[i].latitude}, Lng: ${coordinates[i].longitude}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  coordinates[i],
                );
              },
            ),
          );
        } else {
          debugPrint("Failed to load icon for ${_getCityName(i)}");
          tempMarkers.add(
            Marker(
              markerId: MarkerId(i.toString()),
              position: coordinates[i],
              icon: BitmapDescriptor.defaultMarker,
              onTap: () {
                _customInfoWindowController.addInfoWindow!(
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Text(_getCityName(i)),
                  ),
                  coordinates[i],
                );
              },
            ),
          );
        }
      }

      setState(() {
        markers = tempMarkers;
      });
    } catch (e) {
      debugPrint("Error in loadData: $e");
    }
  }

  /// Converts an asset image into a Uint8List for Google Maps
  Future<Uint8List?> getBytesFromAssets(String path, int width) async {
    try {
      final ByteData data = await rootBundle.load(path);
      final ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetWidth: width,
      );
      final ui.FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
          ?.buffer
          .asUint8List();
    } catch (e) {
      debugPrint("Error loading image $path: $e");
      return null;
    }
  }

  /// Returns city names based on index
  String _getCityName(int index) {
    switch (index) {
      case 0:
        return "Karachi";
      case 1:
        return "Lahore";
      case 2:
        return "Islamabad";
      case 3:
        return "Peshawar";
      default:
        return "Unknown Location";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Markers with Info Window")),
      body: Stack(
        children: [
          GoogleMap(
            markers: Set<Marker>.of(markers),
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
              _customInfoWindowController.googleMapController = controller;
            },
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 300,
            //offset: 35,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }
}
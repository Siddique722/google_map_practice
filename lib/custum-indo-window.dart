
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class CustomMarkerInfoWindow extends StatefulWidget {
  const CustomMarkerInfoWindow({Key? key}) : super(key: key);

  @override
  State<CustomMarkerInfoWindow> createState() => _CustomMarkerInfoWindowState();
}

class _CustomMarkerInfoWindowState extends State<CustomMarkerInfoWindow> {
  CustumInfoWindowController _custumInfoWindowController=CustumInfoWindowController();
  List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
  ];

  List<Marker> markers = [

  ];

  // Coordinates of major Pakistani cities
  List<LatLng> coordinates = [
    LatLng(24.8607, 67.0011),  // Karachi
    LatLng(31.5204, 74.3587),  // Lahore
    LatLng(33.6844, 73.0479),  // Islamabad
    LatLng(34.0151, 71.5249),  // Peshawar
  ];

  static CameraPosition initialCameraPosition= initialCameraPosition = const CameraPosition(
    target: LatLng(30.3753, 69.3451), // Roughly center of Pakistan
    zoom: 5.5,
  );

  @override
  void initState() {
    super.initState();

    loadData();
  }

  /// Loads custom markers for showing only default location icon
  // Future<void> loadData() async {
  //  // List<Marker> tempMarkers = [];
  //
  //   for (int i = 0; i < images.length; i++) {
  //     //final Uint8List? markerIcon = await getBytesFromAssets(images[i], 100);
  //     markers.add(
  //       Marker(markerId: MarkerId(i.toString()),
  //       position: coordinates[i],
  //         icon: BitmapDescriptor.defaultMarker,
  //         infoWindow: InfoWindow(
  //           title: _getCityName(i)
  //         )
  //       )
  //     );
  //     setState(() {
  //
  //     });
  //
  //
  //   }
  //
  //   setState(() {
  //     //markers = tempMarkers;
  //   });
  // }

  /// Loads custom markers for showing  costum location icon
  Future<void> loadData() async {
    // List<Marker> tempMarkers = [];
    for (int i = 0; i < images.length; i++) {
      final Uint8List? markerIcon = await getBytesFromAssets(images[i], 100);
      markers.add(
          Marker(markerId: MarkerId(i.toString()),
              position: coordinates[i],
              icon: BitmapDescriptor.fromBytes(markerIcon!),
              infoWindow: InfoWindow(
                  title: _getCityName(i)
              )
          )
      );
      setState(() {

      });


    }
  }
  /// Converts an asset image into a Uint8List for Google Maps
  Future<Uint8List?> getBytesFromAssets(String path, int width) async {

    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();

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
      appBar: AppBar(title: const Text("Custom Markers")),
      body: Stack(
        children: [
          GoogleMap(
            markers: Set<Marker>.of(markers),
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            initialCameraPosition: initialCameraPosition,

          ),
        ],
      ),
    );
  }
}


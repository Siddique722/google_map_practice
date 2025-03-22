// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class CostumMarker extends StatefulWidget {
//   const CostumMarker({super.key});
//
//   @override
//   State<CostumMarker> createState() => _CostumMarkerState();
// }
//
// class _CostumMarkerState extends State<CostumMarker> {
//
//     List<String> markerImages=[
//       'images/1.png'
//       'images/2.png'
//       'images/3.png'
//       'images/4.png'
//     ];
//     List<Marker> marker =[];
//
//     List<LatLng> cordinates=[
//       LatLng(23, 345),
//       LatLng(23, 345),
//       LatLng(23, 345),
//       LatLng(23, 345),
//     ];
//     loadData(){
//       for(int start=0;start <markerImages.length;start++)
//         {
//           marker.add(
//
//             Marker(
//                 icon: BitmapDescriptor.defaultMarker,
//                 markerId:MarkerId(start.toString()),
//               infoWindow: InfoWindow(
//                   title: "possition :$start")
//
//
//             )
//           );
//           setState(() {
//
//           });
//         }
//     }
// CameraPosition position=CameraPosition(
//   target:LatLng(445,677),
//   zoom:15,
// );
//     @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//           markers:Set<Marker>.of(marker) ,
//           initialCameraPosition: initialCameraPosition,
//         onMapCreated: ,
//
//
//       ),
//
//     );
//   }
// }


import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CostumMarker extends StatefulWidget {
  const CostumMarker({super.key});

  @override
  State<CostumMarker> createState() => _CostumMarkerState();
}

class _CostumMarkerState extends State<CostumMarker> {
  List<String> markerImages = [
    'images/1.png',
    'images/2.png',
    'images/3.png',
    'images/4.png',
  ];

  List<Marker> markers = [];

  // Coordinates of major Pakistani cities
  List<LatLng> coordinates = [
    LatLng(24.8607, 67.0011),  // Karachi
    LatLng(31.5204, 74.3587),  // Lahore
    LatLng(33.6844, 73.0479),  // Islamabad
    LatLng(34.0151, 71.5249),  // Peshawar
  ];

  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    super.initState();
    initialCameraPosition = CameraPosition(
      target: LatLng(30.3753, 69.3451), // Roughly center of Pakistan
      zoom: 5.5,  // Adjusted zoom to show all markers
    );
    loadData();
  }

  Future<void> loadData() async {
    for (int i = 0; i < markerImages.length; i++) {
      final Uint8List markerIcon = await getBytesFromAssets(markerImages[i], 100);

      markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: coordinates[i],
          icon: BitmapDescriptor.fromBytes(markerIcon),  // Fixed from markerImages to markerIcon
          infoWindow: InfoWindow(
            title: _getCityName(i),  // Added city names to info windows
          ),
        ),
      );
    }
    setState(() {});
  }

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,  // Changed to targetWidth from targetHeight
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

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
        return "Position: $index";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(markers),
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          // Controller handling can be added here if needed
        },
      ),
    );
  }
}
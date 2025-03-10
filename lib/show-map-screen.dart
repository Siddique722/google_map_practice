import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  @override
  void initState() {
    super.initState();
  }

  // List<DatatYpe> listName=[]
  Completer<GoogleMapController> completerController=Completer();
  static final CameraPosition cameraPosition=  CameraPosition(
      target: LatLng(31.8626,70.9019),
      zoom: 14.3
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GeoLocator Example")),
      body:
      GoogleMap(
          markers: Set<Marker>.of(
              [
                Marker(markerId: MarkerId('1'),
                    position: LatLng(31.8626, 70.9019),
                    infoWindow: InfoWindow(title: 'Class py focud karo')

                ),
                Marker(markerId: MarkerId('2'),
                    position: LatLng(33.840080, 70.608782),
                    infoWindow: InfoWindow(title: 'how are you')

                ),
              ]
          ),
          mapType: MapType.none,
          onMapCreated: (GoogleMapController controller){
            completerController.complete(controller);
          },
          initialCameraPosition: cameraPosition

      ) ,

      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       // Show Coordinates
      //       Text(
      //         _coordinates,
      //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //       ),
      //       const SizedBox(height: 20),
      //
      //       // Show Extracted Location Info
      //       Text("📍 Place: $placeName",
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      //       Text("🏙️ Locality: $locality",
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      //       Text("🏛️ State: $administrativeArea",
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      //       Text("🌍 Country: $country",
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      //     ],
      //   ),
      // ),
    );
  }
}

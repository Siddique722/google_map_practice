import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/fetch-coordinates.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:

      // Scaffold(
      //   body:
      //   Center(
      //     child: Column(
      //       children:[
      //         SizedBox(height: 100,),
      //         //----- this text use for showing a text Login to your account
      //         Text('Login to your Account',style: TextStyle(
      //             fontSize: 28,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.blueAccent),)
      //         ,SizedBox(height: 20,),
      //         //this container use for enter email
      //         Container(height: 50,
      //           width: 400, decoration: BoxDecoration(
      //             color: Colors.blue, borderRadius: BorderRadius.circular(10)
      //           ), child: Center(child: Text('Enter your Email',style: TextStyle(color: Colors.white),),),),
      //         SizedBox(height: 20,),
      //         //use for password
      //         Container(height: 50, width: 400,
      //           decoration: BoxDecoration(
      //             border: Border.all(color: Colors.blue),
      //             borderRadius: BorderRadius.circular(10)),
      //           child: Center(child: Text('Entet your password',style: TextStyle(color: Colors.blue),),),),
      //         SizedBox(height: 30,),
      //         // use for login button
      //         Container(                height: 40,
      //           width: 250, decoration: BoxDecoration(
      //             color: Colors.blue,
      //             borderRadius: BorderRadius.circular(50)),
      //           child: Center(
      //             child: Text('Login',style: TextStyle(color: Colors.white),),),)
      //         // Container(height: 200,
      //         // width: 200,
      //         //   color: Colors.red,
      //         //
      //         // ),
      //         // SizedBox(
      //         //   height: 10,
      //         // ),
      //         // Container(height: 200,
      //         //   width: 200,
      //         //   color: Colors.blue,
      //         // ),
      //         // SizedBox(height: 30,),
      //         // Container(height: 200,
      //         //   width: 200,
      //         //   color: Colors.red,
      //         // ),
      //         // Container(height: 200,
      //         //   width: 200,
      //         //   color: Colors.green,
      //         // ),
      //         // Container(height: 200,
      //         //   width: 200,
      //         //   color: Colors.red,
      //         // ),
      //       ]
      //     ),
      //   ),
      // )

      //FetchCoordinatesScreen()


      LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _coordinates = "Fetching Coordinates...";

  // Variables for storing location info
  String placeName = "";
  String locality = "";
  String administrativeArea = "";
  String country = "";
String lat='';
String long='';
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Function to Get Current Location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Step 1: Check location services
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _coordinates = "Location services are disabled.";
      });
      return;
    }

    // Step 2: Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied)
    {

      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _coordinates = "Location permissions denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _coordinates = "Location permissions permanently denied.";
      });
      return;
    }

    // Step 3: Fetch Coordinates
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      lat=position.latitude.toString();
      long=position.longitude.toString();
      _coordinates = "Lat: ${position.latitude},\n Lng: ${position.longitude}";
    });

    // Step 4: Fetch Address using Geocoding
    await _getLocationNames(position.latitude, position.longitude);
  }

  // Function to Convert Coordinates to Address
  Future<void> _getLocationNames(double lat, double lng) async {
    try {
      print('Lat:$lat , Lon:$long');
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
// if(placemarks!= null)
     // if (placemarks.isNotEmpty) {
        setState(() {
          placeName = placemarks[0].name??""; //placemarks[0].name ?? "Not Available";
          locality = placemarks[0].locality ?? "Not Available";
          administrativeArea = placemarks[0].administrativeArea ?? "Not Available";
          country = placemarks[0].country ?? "Not Available";
        });
   //   }
    } catch (e) {
      setState(() {
        placeName = "Error fetching location";
        locality = "";
        administrativeArea = "";
        country = "";
      });
    }
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

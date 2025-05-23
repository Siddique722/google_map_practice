import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/fetch-coordinates.dart';


class PlacesNamesScreen extends StatefulWidget {
  @override
  _PlacesNamesScreenState createState() => _PlacesNamesScreenState();
}

class _PlacesNamesScreenState extends State<PlacesNamesScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GeoLocator Example")),
      body:


      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show Coordinates
            Text(
              _coordinates,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Show Extracted Location Info
            Text("📍 Place: $placeName",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("🏙️ Locality: $locality",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("🏛️ State: $administrativeArea",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("🌍 Country: $country",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

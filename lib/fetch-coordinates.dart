// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationScreenn extends StatefulWidget {
//   @override
//   _LocationScreennState createState() => _LocationScreennState();
// }
//
// class _LocationScreennState extends State<LocationScreenn> {
//   String _coordinates = "Fetching Coordinates...";
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   // Function to Get Current Location
//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Step 1: Check location services
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       setState(() {
//         _coordinates = "Location services are disabled.";
//       });
//       return;
//     }
//
//     // Step 2: Check permission
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         setState(() {
//           _coordinates = "Location permissions denied.";
//         });
//         return;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       setState(() {
//         _coordinates = "Location permissions permanently denied.";
//       });
//       return;
//     }
//
//     // Step 3: Fetch Coordinates
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//
//     setState(() {
//       _coordinates = "Latitude: ${position.latitude},\nLongitude: ${position.longitude}";
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Current Location")),
//       body: Center(
//         child: Text(
//           _coordinates,
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class FetchCoordinatesScreen extends StatefulWidget {
  @override
  _FetchCoordinatesScreenState createState() => _FetchCoordinatesScreenState();
}

class _FetchCoordinatesScreenState extends State<FetchCoordinatesScreen> {
  String _coordinates = "Fetching Coordinates...";

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
    if (permission == LocationPermission.denied) {
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
      _coordinates = "📍 Latitude: ${position.latitude}\n📍 Longitude: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Current Location"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)], // Gradient Colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: Colors.white.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on, size: 50, color: Colors.redAccent),
                  const SizedBox(height: 10),
                  Text(
                    "Your Current Location",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _coordinates,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: _getCurrentLocation,
                    icon: Icon(Icons.refresh, color: Colors.white),
                    label: Text("Refresh Location"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

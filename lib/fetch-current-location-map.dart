// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//
//
//
// class UserCurrentLocationMap extends StatefulWidget {
//   @override
//   _UserCurrentLocationMapState createState() => _UserCurrentLocationMapState();
// }
//
// class _UserCurrentLocationMapState extends State<UserCurrentLocationMap> {
//   GoogleMapController? _controller;
//   Set<Marker> _markers = {};
//
//   static const CameraPosition _initialCameraPosition = CameraPosition(
//     target: LatLng(33.6844, 73.0479), // Default location (Islamabad, PK)
//     zoom: 14,
//   );
//
//   Future<Position> getUserCurrentLocation() async {
//     await Geolocator.requestPermission().then((value) {}).catchError((error) {
//       print("Error: $error");
//     });
//
//     return await Geolocator.getCurrentPosition();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         initialCameraPosition: _initialCameraPosition,
//         markers: _markers,
//         onMapCreated: (GoogleMapController controller) {
//           _controller = controller;
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.location_on),
//         onPressed: () async {
//           Position position = await getUserCurrentLocation();
//           print('My Current Location: ${position.latitude}, ${position.longitude}');
//
//           LatLng userLatLng = LatLng(position.latitude, position.longitude);
//
//           setState(() {
//             _markers.clear();
//             _markers.add(
//               Marker(
//                 markerId: MarkerId('currentLocation'),
//                 position: userLatLng,
//                 infoWindow: InfoWindow(title: 'My current location'),
//               ),
//             );
//           });
//
//           _controller?.animateCamera(CameraUpdate.newCameraPosition(
//             CameraPosition(target: userLatLng, zoom: 14),
//           ));
//         },
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class UserCurrentLocationMap extends StatefulWidget {
  @override
  _UserCurrentLocationMapState createState() => _UserCurrentLocationMapState();
}

class _UserCurrentLocationMapState extends State<UserCurrentLocationMap> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};
  LatLng? _currentLatLng;
  String _currentAddress = "Fetching location...";

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(33.6844, 73.0479), // Default: Islamabad, PK
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    _fetchUserLocation();
  }

  /// ✅ Fetch user's current location & update UI
  Future<void> _fetchUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        print("Location permission is permanently denied.");
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    _currentLatLng = LatLng(position.latitude, position.longitude);

    _getAddressFromLatLng(position.latitude, position.longitude);

    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId("currentLocation"),
          position: _currentLatLng!,
          infoWindow: InfoWindow(title: "My Current Location", snippet: _currentAddress),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        ),
      );
    });

    _controller?.animateCamera(CameraUpdate.newLatLngZoom(_currentLatLng!, 14));
  }

  /// ✅ Get Address from Latitude & Longitude
  Future<void> _getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks.first;
      setState(() {
        _currentAddress = "${place.street}, ${place.locality}, ${place.country}";
      });
    } catch (e) {
      print("Error getting address: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Location Map")),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        myLocationEnabled: true, // ✅ Blue dot for current location
        myLocationButtonEnabled: false, // Hides default location button
        zoomControlsEnabled: false, // Hides default zoom controls
        markers: _markers,
        mapType: MapType.normal, // Default: Normal view
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "location",
            child: Icon(Icons.location_searching),
            onPressed: _fetchUserLocation,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "mapType",
            child: Icon(Icons.map),
            onPressed: () {
              setState(() {
                _controller?.setMapStyle(null);
              });
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';



class UserCurrentLocationMap extends StatefulWidget {
  @override
  _UserCurrentLocationMapState createState() => _UserCurrentLocationMapState();
}

class _UserCurrentLocationMapState extends State<UserCurrentLocationMap> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(33.6844, 73.0479), // Default location (Islamabad, PK)
    zoom: 14,
  );

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value) {
      
    }).catchError((error) {
      print("Error: $error");
    });
  //marker=await Geolocator.getCurrentPosition();
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_on),
        onPressed: () async {
          Position position = await getUserCurrentLocation();
          print('My Current Location: ${position.latitude}, ${position.longitude}');

          LatLng userLatLng = LatLng(position.latitude, position.longitude);

          setState(() {
            //_markers.clear();
            _markers.add(
              Marker(
                markerId: MarkerId('1'),
                position: userLatLng,
                infoWindow: InfoWindow(title: 'My current location'),
              ),
            );
          });

          _controller?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: userLatLng, zoom: 14),
          ));
        },
      ),
    );
  }
}

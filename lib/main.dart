import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/fetch-coordinates.dart';
import 'package:untitled/fetch-current-location-map.dart';
import 'package:untitled/search-place-screen.dart';
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
      //GooglePlacesSearch()
      // Scaffold(
      //   body:
      //       Column(children: [
      //         //--- 1st row for icons
      //         Row(
      //           // use for X-Axis in row
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //
      //           children: [
      //           Icon(Icons.home),
      //           Icon(Icons.video_camera_back_outlined),
      //           Icon(Icons.person_3),
      //           Icon(Icons.shopping_bag),
      //           Icon(Icons.notifications_active),
      //           Icon(Icons.menu)
      //
      //         ],),
      // SizedBox(height: 10,),
      // //-----row for stories
      //         SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: Row(
      //             spacing: 10,
      //             children: [
      //               Container(
      //                 height: 270,
      //                 width: 160,
      //                 decoration: BoxDecoration(
      //                     color: Colors.blue,
      //                     borderRadius: BorderRadius.circular(10)
      //
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     SizedBox(height: 50,),
      //                     CircleAvatar(child: Text('1'),),
      //                     SizedBox(height: 30,),
      //                     // Spacer(),
      //                     Text('data')
      //                   ],
      //                 ),
      //               ),
      //
      //               Container(
      //                 height: 140,
      //                 width: 250,
      //                 color: Colors.red,
      //               ),
      //               Container(
      //                 height: 140,
      //                 width: 250,
      //                 color: Colors.blue,
      //               ),
      //               Container(
      //                 height: 140,
      //                 width: 250,
      //                 color: Colors.purple,
      //               ),
      //               Container(
      //                 height: 140,
      //                 width: 250,
      //                 color: Colors.blue,
      //               ),
      //               Container(
      //                 height: 140,
      //                 width: 250,
      //                 color: Colors.orange,
      //               ),
      //             ],),
      //         ),
      //
      //       ],)
      // )
    //  GooglePlacesSearch()
      OpenStreetMapSearch()
      //UserCurrentLocationMap(),
    );
  }
}


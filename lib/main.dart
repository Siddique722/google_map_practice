import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/fetch-coordinates.dart';
import 'package:untitled/fetch-current-location-map.dart';
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
      Scaffold(
        body:
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 10,
            children: [
            Container(
              height: 270,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)

              ),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  CircleAvatar(child: Text('1'),),
                 SizedBox(height: 30,),
                  // Spacer(),
                  Text('data')
                ],
              ),
            ),

            Container(
              height: 140,
              width: 250,
              color: Colors.red,
            ),
            Container(
              height: 140,
              width: 250,
              color: Colors.blue,
            ),
            Container(
              height: 140,
              width: 250,
              color: Colors.purple,
            ),
            Container(
              height: 140,
              width: 250,
              color: Colors.blue,
            ),
            Container(
              height: 140,
              width: 250,
              color: Colors.orange,
            ),
          ],),
        ),
      )


   //   UserCurrentLocationMap(),
    );
  }
}


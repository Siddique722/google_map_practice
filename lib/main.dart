// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:untitled/fetch-coordinates.dart';
// import 'package:untitled/fetch-current-location-map.dart';
// import 'package:untitled/search-place-screen.dart';
// void main(){
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:
//       //GooglePlacesSearch()
//
//       Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.black12,
//        ),
//         body:
//             Column(children: [
//               //--- 1st row for icons
//               Row(
//                 // use for X-Axis in row
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                 Icon(Icons.home),
//                 Icon(Icons.video_camera_back_outlined),
//                 Icon(Icons.person_3),
//                 Icon(Icons.shopping_bag),
//                 Icon(Icons.notifications_active),
//                 Icon(Icons.menu)
//               ],),
//               // Container(
//               //   height: 4,
//               //   color: Colors.black,
//               //   width: double.infinity,
//               // ),
//               SizedBox(height: 10,),
//               Divider(color: Colors.black,thickness: 4,),
//               //-----row for stories
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   spacing: 10,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 270,
//                         width: 160,
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(10)
//                         ),
//                         child:
//                         // Padding(
//                         //   padding: const EdgeInsets.all(18.0),
//                         //   child: Container(
//                         //     height:double.infinity,
//                         //     width: double.infinity,
//                         //     color: Colors.deepOrange,
//                         //   ),
//                         // )
//                         Padding(
//                           padding: const EdgeInsets.all(18.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                                              //       SizedBox(height: 50,),
//                               CircleAvatar(child: Text('1'),),
//                                                //     SizedBox(height: 30,),
//                                Spacer(),
//                               Text('data')
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     Container(
//                       height: 140,
//                       width: 250,
//                       color: Colors.red,
//                     ),
//                     Container(
//                       height: 140,
//                       width: 250,
//                       color: Colors.blue,
//                     ),
//                     Container(
//                       height: 140,
//                       width: 250,
//                       color: Colors.purple,
//                     ),
//                     Container(
//                       height: 140,
//                       width: 250,
//                       color: Colors.blue,
//                     ),
//                     Container(
//                       height: 140,
//                       width: 250,
//                       color: Colors.orange,
//                     ),
//                   ],),
//               ),
//
//             ],)
//       )
//
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 37, 45, 52),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 55, 110, 110),
              actions: [
                Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(width: 40),
                Icon(Icons.search, color: Colors.white, size: 40),
                SizedBox(width: 40),
                Icon(Icons.message_sharp, color: Colors.white, size: 40),
                SizedBox(width: 40),
              ],
              title: Text(
                'facebook',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: false,
            ),
            body: Column(
              //SingleChildScrollView(scrollDirection: Axis.horizontal),
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10),
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    Icon(Icons.video_camera_back, color: Colors.white),
                    Icon(Icons.person_3, color: Colors.white),
                    Icon(Icons.shopping_bag, color: Colors.white),
                    Icon(Icons.notifications, color: Colors.white),
                    Icon(Icons.menu, color: Colors.white),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(height: 20),
                  Container(
                      height: 10,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ]),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(width: 100),
                      Container(
                        height: 30,
                        width: 210,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Whats on your mind?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 100),
                      Icon(
                        Icons.photo,
                        color: Colors.white,
                      ),
                    ]),
                SizedBox(height: 20),
                SingleChildScrollView(

                 scrollDirection: Axis.horizontal, child: Row(spacing: 10, children: [
                    //SingleChildScrollView(scrollDirection: Axis.horizontal),
                    SizedBox(width: 10),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                    Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                          ),
                          Text(''),
                        ])),
                  ]),
                )
              ],
            )));
  }
}
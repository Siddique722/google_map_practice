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
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled/get-class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:  LuckyGame()//Goldapphm()
        // Scaffold(
        //   appBar: AppBar(
        //     leading: CircleAvatar(
        //       // radius: ,
        //       // backgroundColor: ,
        //       // child: ,
        //       backgroundImage: AssetImage('assets/googlemap.jpg'),
        //     ),
        //     title: CircleAvatar(
        //       backgroundImage: AssetImage('assets/pic.jpeg'),
        //     ),
        //   ),
        //     backgroundColor: Colors.white,//const Color.fromARGB(255, 37, 45, 7),
        // body: Column(
        //   //SingleChildScrollView(scrollDirection: Axis.horizontal),
        //   children: [
        //     SizedBox(height: 10),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         SizedBox(height: 10),
        //         Icon(
        //           Icons.home,
        //
        //         ),
        //         Icon(Icons.video_camera_back, ),
        //         Icon(Icons.person_3, ),
        //         Icon(Icons.shopping_bag,),
        //         Icon(Icons.notifications,),
        //         Icon(Icons.menu,  ),
        //       ],
        //     ),
        //     Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        //
        //       Container(
        //           height: 10,
        //           width: 100,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(15),
        //           )),
        //     ]),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           CircleAvatar(
        //             radius: 25,
        //             backgroundColor: Colors.blue,
        //           ),Container(
        //             height: 30,
        //             width: 210,
        //             decoration: BoxDecoration(
        //               color: Colors.green,
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: Center(
        //               child: Text(
        //                 'Whats on your mind?',
        //                 style: TextStyle(
        //                     color: Colors.black,
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.bold),
        //               ),
        //             ),
        //           ),Icon(
        //             Icons.photo,
        //             color: Colors.grey,
        //           ),
        //         ]),
        //     SizedBox(height: 20),
        //     SingleChildScrollView(
        //
        //       scrollDirection: Axis.horizontal, child: Row(spacing: 10, children: [
        //       //SingleChildScrollView(scrollDirection: Axis.horizontal),
        //       SizedBox(width: 10),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //               image: DecorationImage(
        //                   image: AssetImage('assets/pic.jpeg')
        //                   ,fit:BoxFit.cover
        //               )
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //             image: DecorationImage(
        //                 image: AssetImage('assets/googlemap.jpg')
        //                 ,fit:BoxFit.cover
        //             )
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundImage: AssetImage('assets/pic.jpeg'),
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //       Container(
        //           height: 250,
        //           width: 170,
        //           decoration: BoxDecoration(
        //             color: Colors.grey,
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           child: Column(children: [
        //             SizedBox(height: 10),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.deepOrange,
        //             ),
        //             Text(''),
        //           ])),
        //     ]),
        //     ),
        //
        //
        //     Padding(
        //       padding: EdgeInsets.all(18),
        //       child: Row(children:[
        //         SizedBox(width: 10,),
        //         CircleAvatar(),
        //         SizedBox(width:5),
        //         Column(children:[
        //           Text("User name",),
        //           Text('last time')
        //         ]),
        //         Spacer(),
        //         //                  SizedBox(width: 50,),
        //         Icon(Icons.more_horiz),
        //         Icon(Icons.close_outlined),
        //         SizedBox(width: 10,)
        //       ]),
        //     ),
        //
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Row(children: [
        //           Icon(Icons.thumb_up_alt_outlined),
        //           Text('Like'),
        //         ],),
        //         Row(children: [
        //           Icon(Icons.comment_bank),
        //           Text('Comment'),
        //
        //         ],),
        //         Row(children: [
        //         Icon(Icons.share),
        //         Text('Share')
        //
        //       ],)
        //     ],)
        //   ],
        //
        // )
        // ),
            // appBar: AppBar(
            //   backgroundColor: const Color.fromARGB(255, 55, 110, 110),
            //   actions: [
            //     Icon(
            //       Icons.add_circle,
            //       color: Colors.white,
            //       size: 40,
            //     ),
            //     SizedBox(width: 40),
            //     Icon(Icons.search, color: Colors.white, size: 40),
            //     SizedBox(width: 40),
            //     Icon(Icons.message_sharp, color: Colors.white, size: 40),
            //     SizedBox(width: 40),
            //   ],
            //   title: Text(
            //     'facebook',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 50,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   centerTitle: false,
            // ),
            //
            // ------------------------
            // body:Center(child: FloatingActionButton(onPressed: (){
            //   //--get package---
            //   Get.defaultDialog(
            //     title: 'Confirmation',
            //     backgroundColor: Colors.purple,
            //       content: Text('Are you sure, you want to exit it?'),
            //       actions: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //           Container(
            //               color: Colors.white,
            //               child: TextButton(onPressed: (){}, child: Text('YES'))),
            //           Container(
            //             color: Colors.white,
            //             child: TextButton(
            //
            //                 onPressed: (){
            //                   Get.back();
            //                   //Navigator.pop(context);
            //                 }, child: Text('NO')),
            //           ),
            //         ],)
            //
            //     ]
            //   );
            // },backgroundColor: Colors.purple,),)
   //    )

      );
  }
}
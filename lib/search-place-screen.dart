// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:uuid/uuid.dart';
//
// class GooglePlacesSearch extends StatefulWidget {
//   @override
//   _GooglePlacesSearchState createState() => _GooglePlacesSearchState();
// }
//
// class _GooglePlacesSearchState extends State<GooglePlacesSearch> {
//   TextEditingController _controller = TextEditingController();
//   Uuid uuid = Uuid();
//   String? _sessionToken;
//   List<dynamic> _placesList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       onChange();
//     });
//   }
//
//   void onChange() {
//     if (_sessionToken == null) {
//       setState(() {
//         _sessionToken = uuid.v4();
//       });
//     }
//
//     getSuggestion(_controller.text);
//   }
//
//   Future<void> getSuggestion(String input) async {
//     String kPLACES_API_KEY = "AIzaSyDQZc_pQSOFSyJxGmKFVvWkYJ0M9sioiw";
//     String baseURL = "https://maps.googleapis.com/maps/api/place/autocomplete/json";
//     String url =
//         "$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken";
//
//     var response = await http.get(Uri.parse(url));
// print('-------------');
//     print(response.body.toString());
//
//     if (response.statusCode == 200) {
//       setState(() {
//         _placesList = jsonDecode(response.body.toString())['predictions'];
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text('Google Search Places API'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 hintText: "Search places...",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _placesList.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_placesList[index]["description"]),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OpenStreetMapSearch extends StatefulWidget {
  @override
  _OpenStreetMapSearchState createState() => _OpenStreetMapSearchState();
}

class _OpenStreetMapSearchState extends State<OpenStreetMapSearch> {
  TextEditingController _controller = TextEditingController();
  List<dynamic> _placesList = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    getSuggestion(_controller.text);
  }

  Future<void> getSuggestion(String input) async {
    if (input.isEmpty) return; // Prevents unnecessary API calls

    String url = "https://nominatim.openstreetmap.org/search?q=$input&format=json";

    var response = await http.get(Uri.parse(url));

    print('-------------');
    print(response.body.toString());

    if (response.statusCode == 200) {
      setState(() {
        _placesList = jsonDecode(response.body.toString());
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('OpenStreetMap Search API'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Search places...",
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _placesList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_placesList[index]["display_name"]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

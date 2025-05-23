import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/custum-indo-window.dart';


class WhatsappUi extends StatefulWidget {
  const WhatsappUi({super.key});

  @override
  State<WhatsappUi> createState() => _WhatsappUiState();
}

class _WhatsappUiState extends State<WhatsappUi> {
  int select=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Colors.deepPurpleAccent,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent
              ),
             currentAccountPicture: CircleAvatar(),
                accountName: Text('data',style:GoogleFonts.aboreto(
                  //fontSize: 50
                )),
                accountEmail: Text('data',style: GoogleFonts.allison(),)),
            ListTile(
              onTap: (){
                Navigator.pop(context);
              },
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomMarkerInfoWindow()));

              },
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            )

            
          ],
        ),
      ),
      body: Column(children: [
        Expanded(
            flex: 90,
            child: select==1?ChatScreen() : select==2?UpdatesScreen(): select==3?CommunityScreen():CallScreen()

        ),
        Expanded(
            flex: 10,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                TextButton(onPressed: (){
                  select=1;
                  setState(() {

                  });
                }, child: Text('Chats')),
                TextButton(onPressed: (){
                  select=2;
                  setState(() {

                  });
                }, child: Text('Updats')),
                TextButton(onPressed: (){select=3;setState(() {

                });}, child: Text('Community')),
                TextButton(onPressed: (){
                  select=4;setState(() {

                  });
                }, child: Text('Calls')),

              ],),

            )),
      ],),
    );
  }
}


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text('Chats'),),
    );
  }
}
class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text('Updates'),),
    );
  }
}
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: Center(child: Text('Community'),),
    );
  }
}

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      child: Center(child: Text('Calls'),),
    );;
  }
}




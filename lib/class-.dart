import 'package:flutter/material.dart';


class UniryClass extends StatefulWidget {
  const UniryClass({super.key});

  @override
  State<UniryClass> createState() => _UniryClassState();
}

class _UniryClassState extends State<UniryClass> {
  int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                i=1;
setState(() {

});
              },
              child: Container(
                height: 45,
                width: 250,
                color:
               // if(i==0){Colors.purple}
                //else {Colors.green}
             i==0? Colors.grey:Colors.green
                  ,child: Center(child: Text(i==0?'Unselected':'Selected' )),

            //            Colors.purple,
              ),
            ),

            InkWell(
              onTap: (){
i=0;
setState(() {
  
});
              },
              child: Container(
                height: 45,
                width: 250,
                color:
               // if(i==0){Colors.purple}
                //else {Colors.green}
             i==1? Colors.grey: Colors.green,
            child:
            Center(child: Text(i==1?'Un Selected':'Selected')),

            //            Colors.purple,
              ),
            ),
          ],
        ),),
    );

  }
}

/*
   if(){   }else{   }
   //----
   condition?statement : statement

* */

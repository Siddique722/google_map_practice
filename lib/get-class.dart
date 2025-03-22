import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class GetNullCheck extends StatefulWidget {
  const GetNullCheck({super.key});

  @override
  State<GetNullCheck> createState() => _GetNullCheckState();
}

class _GetNullCheckState extends State<GetNullCheck> {
  TextEditingController tolaPriceController=TextEditingController();
  TextEditingController tolaQuantityController=TextEditingController();
  TextEditingController gramQuantityController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          TextFormField(
            keyboardType: TextInputType.number,
            controller: tolaPriceController,
            decoration: InputDecoration(hintText: 'Tola Price'),
          ),
          TextFormField(
            controller: tolaQuantityController,
            decoration: InputDecoration(hintText: 'Tola Quantity'),
          ),
          TextFormField(
            controller: gramQuantityController,
            decoration: InputDecoration(hintText: 'Gram Quantity'),
          ),
          FloatingActionButton(onPressed: (){
            if(tolaPriceController.text=='')
              {
        
              }
            else {
              if(tolaQuantityController.text=="")
              {
                tolaQuantityController.text='0';
              }
              if(gramQuantityController.text=="")
              {
                gramQuantityController.text='0';
              }
            }
        
        
          })
        ],),
      ),
    );
  }
}



class Goldapphm extends StatefulWidget {
  const Goldapphm({super.key});

  @override
  State<Goldapphm> createState() => _GoldapphmState();
}

class _GoldapphmState extends State<Goldapphm> {
  TextEditingController tolapriceController=TextEditingController();
  TextEditingController tolaquantityController=TextEditingController();
  TextEditingController mashaquantityController=TextEditingController();
  TextEditingController rattiquantityController=TextEditingController();
  double totalbill=0;
  double tolaprice=0;
  double mashaprice=0;
  double rattiprice=0;

  //---functions-------------
  //:-1st function for refresh button--
  void refresh(){
    if(tolapriceController.text.isEmpty && tolaquantityController.text.isEmpty && mashaquantityController.text.isEmpty && rattiquantityController.text.isEmpty)
    {
      Get.defaultDialog(
          title: 'Information',
          content: Text('The field is already empty'),
          actions: [
            Column(
              children:
              [

                Icon(Icons.info,color: Colors.blue,),
                TextButton(onPressed: (){
                  Get.back();
                  setState(() {

                  });
                }, child: Text('Ok')

                ),
              ],
            )

          ]
      );
    }
    else
    {
      Get.defaultDialog(
          title: 'Confirm',
          content: Text('Are you sure want to refresh it?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: TextButton(onPressed: (){
                    Get.back();
                  }, child: Text('No')),
                ),
                Container(
                  child: TextButton(onPressed: (){
                    tolapriceController.clear();
                    tolaquantityController.clear();
                    mashaquantityController.clear();
                    rattiquantityController.clear();
                    totalbill=0;
                    tolaprice=0;
                    mashaprice=0;
                    rattiprice=0;
                    setState(() {
                      Get.back();
                    });
                  }, child: Text('Yes')),
                )
              ],
            )
          ]
      );
    }
    setState(() {

    });
  }

  //--:2nd function for calculation---------
  void calculation()
  {
    if(tolapriceController.text=="")
    {
      Get.snackbar(
          'Error ', 'Please enter the gold price',

          backgroundColor: Colors.red,
          icon: Icon(Icons.warning,color: Colors.red,)
      );
    }
    else
    {

      if(tolaquantityController.text=='')
      {
        tolaquantityController.text='0';
      }
      if(mashaquantityController.text=='')
      {
        mashaquantityController.text='0';
      }
      if(rattiquantityController.text=='')
      {
        rattiquantityController.text='0';
      }

      double tolap;
      double tolaq;
      double mashaq;
      double rattiq;
      double ppmash;// for one masha price
      double tpmasha;// for total masha price
      double ppratti;// for one ratti price
      double tpratti;// for total rati price
      tolap=double.parse(tolapriceController.text);
      tolaq=double.parse(tolaquantityController.text);
      mashaq=double.parse(mashaquantityController.text);
      rattiq=double.parse(rattiquantityController.text);
      // first we find the price of one masha ---
      ppmash=tolap/12;
      tpmasha=ppmash*mashaq;
      // now price of one ratti
      ppratti=tolap/96;
      tpratti=ppratti*rattiq;
      // now total bill
      totalbill=(tolap*tolaq)+tpratti+tpmasha;
      // for extra showing bill
      tolaprice=tolap*tolaq;
      mashaprice=tpmasha;
      rattiprice=tpratti;
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // as the floating action button is itself widget but
      // here it works as the property
      floatingActionButton:
     Column(
       mainAxisAlignment: MainAxisAlignment.end,
       children: [
       FloatingActionButton(onPressed: (){
         // for the confirmation dialouge box----------------------
         refresh();
       },
         backgroundColor: Colors.deepOrange[700],
         child: Icon(Icons.refresh,color: Colors.white,),),
         SizedBox(width: 10,),
         FloatingActionButton(onPressed: (){
           // for the confirmation dialouge box----------------------
           refresh();
         },
           backgroundColor: Colors.deepOrange[700],
           child: Icon(Icons.refresh,color: Colors.white,),),
         SizedBox(height: 50,),
     ],),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[700],
        title: Text('Gold App',
          style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),),

      ),
      body:

      Center(
        child: Column(

          children:[
            SizedBox(height: 20,),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.deepOrangeAccent,
                    width: 2),
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepOrange[700]),
                controller: tolapriceController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.price_change_outlined,
                      color: Colors.deepOrange[700],),
                    hintText: 'Enter gold price',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[700],
                    ),
                    border: InputBorder.none
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepOrange,
                      width: 2)
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepOrange[700]),
                controller: tolaquantityController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.price_change_outlined,color: Colors.deepOrange[700],),
                    hintText: 'Enter your tola quantity',
                    hintStyle: TextStyle(fontWeight: FontWeight. bold,
                        color: Colors.deepOrange[700]),
                    border: InputBorder.none
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepOrange,
                      width: 2)
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepOrange[700]),
                controller: mashaquantityController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.price_change_outlined,color: Colors.deepOrange[700],),
                    hintText: 'Enter your masha quantity',
                    hintStyle: TextStyle(fontWeight: FontWeight. bold,
                        color: Colors.deepOrange[700]),
                    border: InputBorder.none
                ),
              ),

            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepOrange,
                      width: 2)
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepOrange[700]),
                controller: rattiquantityController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.price_change_outlined,color: Colors.deepOrange[700],),
                    hintText: 'Enter your ratti quantity',
                    hintStyle: TextStyle(fontWeight: FontWeight. bold,
                        color: Colors.deepOrange[700]),
                    border: InputBorder.none
                ),
              ),
            ),
            InkWell(
              onTap: (){
                // for the null check----------
          calculation();
              },

              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[700],
                  borderRadius: BorderRadius.circular(8),
                  //  border: Border.all(),
                ),
                child: Center(
                  child: Text('Calculate',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                    ),),
                ),
              ),
            ),
            Text('Total Bill =$totalbill',
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,color: Colors.deepOrange[700]),
            ),
            Text('Tola price =$tolaprice',
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,color: Colors.deepOrange[700]),
            ),
            Text('Masha price =$mashaprice',
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,color: Colors.deepOrange[700]),
            ),
            Text('Ratti price =$rattiprice',
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,color: Colors.deepOrange[700]),
            )
          ],
        ),
      ),
    );
  }
}















class LuckyGame extends StatefulWidget {
  const LuckyGame({super.key});

  @override
  State<LuckyGame> createState() => _LuckyGameState();
}

class _LuckyGameState extends State<LuckyGame> {
  TextEditingController numberController=TextEditingController();
 int randomNumberGenerate(){
    Random random=Random();
   return random.nextInt(9)+1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        int guessNumber=int.parse(numberController.text);
        Random random=Random();

        int x=random.nextInt(90)+10;


        int lucky=randomNumberGenerate();
        print('random generate=$lucky');
        if(guessNumber==lucky)
          {
            Get.defaultDialog(
              title: 'Congrtulation..',
              content: Column(children: [
              Icon(Icons.check_circle_outline),
              Text('You win')
              ],),
              actions: [TextButton(onPressed: (){
                numberController.clear();
                Navigator.pop(context);
              }, child: Text('OKAY'))]
            );
          }
        else
          {
            Get.defaultDialog(
                title: 'Shodaaa..!!!!',
                content: Column(children: [
                  Icon(Icons.check_circle_outline),
                  Text('Qismat kharaab hay tumhaariii')
                ],),
                actions: [TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Thik hay'))]
            );
          }

      }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all()
            ),
            child: TextFormField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Guess a Number'
              ),

            ),
          ),
        ),

      ],),
    );
  }
}





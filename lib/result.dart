import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:untitled2/vehiclescreen.dart';
import 'data.dart';

class Result extends StatelessWidget {
  static const routename = 'result.dart';
  @override
  Widget build(BuildContext context) {
    var routedata=ModalRoute.of(context)!.settings.arguments as Map<String,int>;
    var score = routedata['score'];
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        title: Container(width:(MediaQuery.of(context).size.width-150),child:Center(child: Text('Quiz Result')),),
        backgroundColor: Color.fromRGBO(116, 155, 171, 10),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    'images/resultbackground.jpg',
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.18,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "${(score! / questions.length * 100).truncateToDouble()}%",
                        style: TextStyle(color: Colors.white, fontSize: 70),
                      ),
                    ),
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.28,

                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("Passing Score :50%",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
              if (score / questions.length < 0.5)
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.34,

                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text("You Have Failed the test",
                              style: TextStyle(color: Colors.white, fontSize: 30)),
                        ],
                      ),
                    ))
              else
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.34,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text("You Have Passed the test",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ),
                  ),
                ),

            ],
          ),Spacer(),
          InkWell(
            onTap: (){Navigator.of(context).popAndPushNamed(VehicleScreen.routename,arguments: {'name':selectedcountry});},
            child: Container(
              padding: EdgeInsets.only(left: 80),
              color: Color.fromRGBO(116, 155, 171, 10),
              width:MediaQuery.of(context).size.width ,
              height: 50,
                child: ListTile(leading: Icon(Icons.refresh),
                  title: Text('Restart Test'), ), ),
          ),

        ],

      ),
    );
  }
}

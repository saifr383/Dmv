import 'package:flutter/material.dart';
import 'package:untitled2/Drawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled2/data.dart';
import 'package:untitled2/questionscreen.dart';
class VehicleScreen extends StatefulWidget {

  static const routename = 'vehiclescreen.dart';
  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}
Future<void> storedata(){
  const url='https://dmv-test-9a11a-default-rtdb.firebaseio.com/punjab/test.json';
  return http.post(Uri.parse(url),body: json.encode({'question':'hello','a':'yes','b':'no'}));
}
class _VehicleScreenState extends State<VehicleScreen> {

  @override
  Widget build(BuildContext context) {
    var routedata=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    selectedcountry=routedata['name']!;
    return Scaffold(
      drawer: Drawer(child: drawer(),),
      appBar: AppBar(

        title: Text('Select Vehicle Type'),
        actions: [
          FlatButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(7),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Text(
                  'EN',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
      body: Container(

        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(

              child: InkWell(
                onTap: (){
                  selectedtype='light';
                  Navigator.of(context).pushReplacementNamed(QuestionScreen.routename);
                },
                child: Column(
                  children: [
                    Image.asset(
                      'images/car.png',
                      width: 50,
                      height: 50,
                    ),
                    Text('Light Vehicle Permit Practice Test')
                  ],
                ),
              ),
            ),
            Divider(height: 100),
            InkWell(
              onTap: (){
                selectedtype='heavy';
                Navigator.of(context).pushReplacementNamed(QuestionScreen.routename);
              },
              child: Column(
                children: [
                  Image.asset(
                    'images/truck.png',
                    width: 50,
                    height: 50,
                  ),
                  Text('Heavy Vehicle Permit Practice Test'),
                ],
              ),
            ),
            Divider(height: 100)
          ],
        ),
      ),
    );
  }
}

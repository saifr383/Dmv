
import 'package:flutter/material.dart';
import 'package:untitled2/questionscreen.dart';
import 'package:untitled2/result.dart';
import 'package:untitled2/vehiclescreen.dart';
import 'selectionscreen.dart';
import 'data.dart';
import 'countryscreen.dart';
import 'startscreen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var isloading = false;
  @override
  void initState() {
    setState(() {
      isloading = true;
    });
    getcontry().then((_) {
      setState(() {
        isloading = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DMV test app',
      home:isloading? StartScreen():SelectionScreen(),
      routes: {
        SelectionScreen.routename:(ctx)=>SelectionScreen(),
        CountryScreen.routename:(ctx)=>CountryScreen(),
        VehicleScreen.routename:(ctx)=>VehicleScreen(),
        QuestionScreen.routename:(ctx)=>QuestionScreen(),
        Result.routename:(ctx)=>Result()
      },
    );

  }

}


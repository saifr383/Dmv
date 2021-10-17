import 'package:flutter/material.dart';
import 'package:untitled2/countryscreen.dart';
import 'package:untitled2/Drawer.dart';

class SelectionScreen extends StatelessWidget {
  static const routename='selectionscreen.dart';
  @override
  Widget build(BuildContext context) {
    var sheight = MediaQuery.of(context).size.height;
    var swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: drawer(),
      ),
      backgroundColor: Color.fromARGB(255, 0, 69, 110),
      appBar: AppBar(
        title: Text('DrivingTests101'),
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
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: swidth * 0.05, top: 50, bottom: 30),
              height: sheight * 0.2,
              width: swidth * 0.7,
              child: FittedBox(
                child: Image.asset(
                  'images/logo.jpg',
                ),
                fit: BoxFit.fitHeight,
              )),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(CountryScreen.routename);
            },
            child: Container(
              color: Colors.white,
              height: 50,
              margin: EdgeInsets.only(left: 30, right: 30, top: 0),
              child: Row(children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Select a State',
                  ),
                ),
                new Spacer(),
                Icon(Icons.arrow_drop_down),
              ]),
            ),
          ),
          new Spacer(),
          Image.asset(
            'images/footer.jpg',
            width: double.infinity,
            height: 100,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 69, 110),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Image.asset('images/text.jpg'),
                margin: EdgeInsets.only(top: 215, bottom: 30),
              ),
              Container(
                  child: FittedBox(
                    child: Image.asset('images/logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                  margin: EdgeInsets.only(left: 20, bottom: 30),
                  width: 100,
                  height: 150),
              Image.asset('images/des.jpg'),
              new Spacer(),
              Image.asset('images/footer.jpg')
            ],
          ),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}

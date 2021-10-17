import 'package:flutter/material.dart';
import 'package:untitled2/selectionscreen.dart';

class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'images/drawer.jpg',
            height: 200,
          ),
          InkWell(child: ListTile(leading: Icon(Icons.home),title: Text('Home'),),onTap:(){Navigator.of(context).pushReplacementNamed(SelectionScreen.routename);},),
          Divider(height: 0),
          ListTile(leading: Icon(Icons.person_outline),title: Text('About Us'),),
          Divider(height: 0),
          ListTile(leading: Icon(Icons.lock_outline),title: Text('Privacy Policy'),),
          Divider(height: 0),
          ListTile(leading: Icon(Icons.lightbulb_outline),title: Text('Help'),),
          Divider(height: 0),
          ListTile(leading: Icon(Icons.facebook_outlined),title: Text('Like Us'),),
          Divider(height: 0),

        ],
      ),
    );
  }
}

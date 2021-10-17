import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/selectionscreen.dart';
import 'package:untitled2/vehiclescreen.dart';
import 'data.dart';

class CountryScreen extends StatelessWidget {
  static const routename = 'countryscreen.dart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a state'),
      ),
      body:Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){Navigator.of(context).pushNamed(VehicleScreen.routename,arguments:{'name':countries[index]});},
                      child: Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          countries[index],
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    );
                  },
                  itemCount: countries.length,
                ),
                new Spacer(),
                Container(
                  color: Color.fromRGBO(116, 155, 171, 10),
                  child: FlatButton(

                    minWidth: double.infinity,
                    onPressed: () {Navigator.of(context).pushReplacementNamed(SelectionScreen.routename);},
                    child: Container(alignment:Alignment.centerLeft,child: Text('Cancel',)),
                  ),
                  width: double.infinity,

                )
              ],
            ),
    );
  }
}

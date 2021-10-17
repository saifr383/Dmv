import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/Drawer.dart';
import 'package:untitled2/data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'result.dart';

class QuestionScreen extends StatefulWidget {
  static const routename = 'questionscreen.dart';
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var isloading = false;
  Color _colora = Colors.white;
  Color _colorb = Colors.white;
  Color _colorc = Colors.white;
  Color _colord = Colors.white;
  var index = 0;
  var answered = false;
  var score=0;
  @override
  void initState() {
    setState(() {
      isloading = true;
    });
    getquestion().then((_) {
      setState(() {
        isloading = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: drawer(),
      ),
      appBar: AppBar(
        title: Text('Practice Test'),
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width,
                    lineHeight: 10.0,
                    percent: index/questions.length,
                    backgroundColor: Colors.grey[100],
                    progressColor: Colors.yellow,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    questions[index].question,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                InkWell(
                  child: Container(
                    color: _colora,
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'A. ${questions[index].optiona}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!answered) {
                        answered = true;
                        if (questions[index].optiona == questions[index].answer){
                          _colora = Colors.green;
                        score++;}
                        else {
                          _colora = Colors.red;
                          if (questions[index].optionb ==
                              questions[index].answer)
                            _colorb = Colors.green;
                          else if (questions[index].optionc ==
                              questions[index].answer)
                            _colorc = Colors.green;
                          else if (questions[index].optiond ==
                              questions[index].answer) _colord = Colors.green;
                        }
                      }
                    });
                  },
                ),
                Divider(
                  height: 0,
                ),
                InkWell(
                  child: Container(
                    color: _colorb,
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'B. ${questions[index].optionb}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!answered) {
                        answered = true;
                        if (questions[index].optionb == questions[index].answer){
                          _colorb = Colors.green;
                          score++;}
                        else {
                          _colorb = Colors.red;
                          if (questions[index].optiona ==
                              questions[index].answer)
                            _colora = Colors.green;
                          else if (questions[index].optionc ==
                              questions[index].answer)
                            _colorc = Colors.green;
                          else if (questions[index].optiond ==
                              questions[index].answer) _colord = Colors.green;
                        }
                      }
                    });
                  },
                ),
                Divider(
                  height: 0,
                ),
                InkWell(
                  child: Container(
                    color: _colorc,
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'C. ${questions[index].optionc}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!answered) {
                        answered = true;
                        if (questions[index].optionc == questions[index].answer){
                          _colorc = Colors.green;
                          score++;}
                        else {
                          _colorc = Colors.red;
                          if (questions[index].optionb ==
                              questions[index].answer)
                            _colorb = Colors.green;
                          else if (questions[index].optiona ==
                              questions[index].answer)
                            _colora = Colors.green;
                          else if (questions[index].optiond ==
                              questions[index].answer) _colord = Colors.green;
                        }
                      }
                    });
                  },
                ),
                Divider(
                  height: 0,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: _colord,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'D. ${questions[index].optiond}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!answered) {
                        answered = true;
                        if (questions[index].optiond ==
                            questions[index].answer) {
                          _colord = Colors.green;score++;
                        } else {
                          _colord = Colors.red;
                          if (questions[index].optionb ==
                              questions[index].answer)
                            _colorb = Colors.green;
                          else if (questions[index].optionc ==
                              questions[index].answer)
                            _colorc = Colors.green;
                          else if (questions[index].optiona ==
                              questions[index].answer) _colora = Colors.green;
                        }
                      }
                    });
                  },
                ),
                Divider(
                  height: 0,
                ),
                Spacer(),
                InkWell(
                  onTap:() {
                    if(answered==true){
                      _colora = Colors.white;
                      _colorb = Colors.white;
                      _colorc = Colors.white;
                      _colord = Colors.white;
                      answered = false;
                      if (index < questions.length - 1) {
                        setState(() {
                          index++;
                        });
                      } else
                        Navigator.of(context).pushReplacementNamed(Result.routename,arguments: {'score':score});
                    }
                    else
                      Fluttertoast.showToast(
                          msg: "Not Answered",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);} ,
                  child: Container(
                    color: Color.fromRGBO(116, 155, 171, 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Center(child: Text('Next',style: TextStyle(fontSize: 30),)),
                  ),
                ),
              ],
            ),
    );
  }
}

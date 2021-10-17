import 'dart:convert';
import 'package:http/http.dart' as http;
import 'mcqs.dart';
import 'package:flutter/material.dart';

List<String> countries = [];

String selectedcountry = '';
String selectedtype = '';

List<Mcqs> questions = [];
Future<void> getcontry() async {
  List<String> loadedcountries = [];
  const url =
      'https://dmv-test-9a11a-default-rtdb.firebaseio.com/countries.json';
  var response = await http.get(Uri.parse(url));
  var data = json.decode(response.body) as Map<String, dynamic>;
  data.forEach((key, value) {
    loadedcountries.add(value['name']);
  });
  countries = loadedcountries;
}

Future<void> getquestion() async {
  List<Mcqs> loaded = [];
  var url =
      'https://dmv-test-9a11a-default-rtdb.firebaseio.com/$selectedcountry/$selectedtype.json';
  var response = await http.get(Uri.parse(url));
  var data = json.decode(response.body) as Map<String, dynamic>;
  data.forEach((key, value) {
    loaded.add(Mcqs(value['question'], value['optiona'], value['optionb'],
        value['optionc'], value['optiond'], value['answer']));
  });
  questions = loaded;
}

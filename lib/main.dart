import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/chooseLocation.dart';
import 'package:worldtimeapp/pages/loading.dart';
import 'pages/home.dart';

void main() =>  runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => loading(),
    '/home' : (context) => home(),
    '/location' : (context) => chooseLocation(),
  },
));

import 'package:day7/rgb_maker.dart';
import 'package:day7/shades_with_params.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/shades': (context) => ShadesWithParams(),
        '/rgbmaker' : (context) => RGBmakerPage(),
        '/homepage' : (context) => MyHomePage(title: 'Flutter Demo Home Page')
      }
    );
  }
}


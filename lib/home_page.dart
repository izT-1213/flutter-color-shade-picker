import 'package:day7/shades_page.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  void navigateToShadePage(BuildContext context, MaterialAccentColor color) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) {
          return ShadesPage(color: color);
        }),
    );
  }

  void navigateUsingStatic(BuildContext context, MaterialAccentColor color){
    Navigator.pushNamed(context, '/shades', arguments: color);
  }

  void navigateToRGB(BuildContext context){
    Navigator.pushNamed(context, '/rgbmaker');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colors'),
      ),
      body: ListView.builder(
        itemCount: Colors.accents.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              navigateUsingStatic(context, Colors.accents.elementAt(index));
            },
            child: ListItem(
              color: Colors.accents.elementAt(index),
            )
          );
        },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateToRGB(context);
        },
          child: const Icon(Icons.palette),
    )
    );
  }
}

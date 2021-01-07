import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('ListView Demo'),
        ),
        body:ListView(
          children: <Widget>[
            Container(
              color: Colors.red,
              height: 500.0,
              child: const Center(child: Text('RED')),
            ),
            Container(
              color:Colors.blue,
              height: 500.0,

              child: const Center(child: Text('BLUE')),
            ),
          ],


        ),
      ),


    );

  }
}


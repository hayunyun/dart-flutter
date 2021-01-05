import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  int _counter =0;

  void _incrementCounter(){

    _counter++;
    print('_incrementCounter : $_counter');
  }

  @override
  Widget build(BuildContext context){
    print('StatelessWidget TestApp build');
    return new MaterialApp( title: 'StatelessWidget Test App',
    home:Scaffold(
      appBar: AppBar(
        title: Text('StatelessWidget Demo'),
      ),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
    tooltip: 'Increment',
    child: Icon(Icons.add),
    ),
    ),
    );
  }
}
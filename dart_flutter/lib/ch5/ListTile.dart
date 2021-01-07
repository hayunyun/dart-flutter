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
        body: page1(),
      ),


    );

  }

  ListView page1(){
    return ListView(
      children: <Widget>[
        ListTile(
          title:Text('ListView'),
          subtitle: Text('Using ListTile'),
          trailing: Icon(Icons.more_vert),
          onTap: () {},
        ),
        ListTile(
          leading: FlutterLogo(
            size:50.0,
          ),
          title: Text('Flutter'),
          trailing: Icon(Icons.autorenew),
          onTap:(){},
        ),
        ListTile(
          leading: Icon(
            Icons.account_box,
            size:50.0,
          ),
          title : Text('Contacts'),
          subtitle: Text('Add Phone Number'),
          trailing: Icon(Icons.add),
          onTap: () {},
        ),
      ],
    );
  }


}


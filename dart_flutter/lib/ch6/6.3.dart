
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(StateDemo());

class StateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<String>.value(
      value: 'Shared Data',
      child: MaterialApp(
          title: 'Flutter Demo App',
          initialRoute:'/page1',
          routes:{
            '/page1': (context) =>FirstPage(),
            '/page2': (context) => SecondPage(),

          }
      ),
    );
  }
}


class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirstPageState();

}

class FirstPageState extends State<FirstPage>{
  var result;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: <Widget> [
            Center(
              child: RaisedButton(
                onPressed: () async {
                  result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(context) => SecondPage(
                          data: '(request)',
                        )
                    ),
                  );
                },
                child: Text('go to next page'),
              ),
            ),
            Text('$result'),


          ],
        )
    );
  }
}


class SecondPage extends StatelessWidget{
  final String data;

  SecondPage({@required  this.data});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, '(result)');
                },
                child: Text('go to previous page'),
              ),
            ),
            Text('$data'),
          ],
        )
    );
  }
}
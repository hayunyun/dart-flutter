import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
//import 'package:foreground_service/foreground_service.dart';
import 'package:android_intent/android_intent.dart';
import 'package:android_intent/flag.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:weather/weather.dart';


void main(){
  runApp(new AlarmWeather());
}

class AlarmWeather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlarmWeatherState();
}

class AlarmWeatherState extends State<AlarmWeather> {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(title: 'Flutter Project', home : MainPage(), routes: {
      '/page1' : (context) => MainPage(),
      //'/page2' : (context) => SecondPage(),
    });
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _curPageIndex = 0;
  String _weatherStr;

  @override
  Widget build(BuildContext context) {
    //setRebirth(context);
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Alarm and Weather'),
      ),
      body: getPage(),
      floatingActionButton: getButton(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _curPageIndex = index;
          });
          if (index == 1) {
            getWeather();
          }
        },

        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.alarm,
                size: 30,
                color: _curPageIndex == 0 ? Colors.blue : Colors.black54,
              ),
              label: 'Alarm'

          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.wb_sunny,
                size: 30,
                color: _curPageIndex == 1 ? Colors.blue : Colors.black54,
              ),
              label: 'Weather'

          ),


        ],

      ),
    );
  }

  Widget getPage() {
    Widget page;
    switch (_curPageIndex) {
      case 0:
        page = alarmPage();
        break;
      case 1:
        page = weatherPage();
        break;
    }
    return page;
  }

  FloatingActionButton getButton() {
    FloatingActionButton button;
    switch (_curPageIndex) {
      case 0 :
        button = alarmAddButton();
        break;
      case 1:
        button = null;
        break;
    }
    return button;
  }

  FloatingActionButton alarmAddButton() {
    return FloatingActionButton(
      tooltip: 'Add Alarm',
      child: Icon(Icons.alarm_add),
      onPressed: () {

      },
    );
  }

  ListView alarmPage() {
    return ListView(
      children: <Widget>[
        Text('Empty....'),
      ],
    );
  }

  Center weatherPage() {
    if (_weatherStr != null) {
      if (_weatherStr.contains('Clear')) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '서울',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.blue,
                    size: 150.0,
                  ),
                  Text(
                    '맑음',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ]
            )
        );
      }
      else if (_weatherStr.contains('Clouds')) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '서울',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Icon(
                    Icons.cloud,
                    color: Colors.blue,
                    size: 150.0,
                  ),
                  Text(
                    '흐림',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ]
            )
        );
      }
      else if (_weatherStr.contains('Rain')) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '부산',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Icon(
                    Icons.grain,
                    color: Colors.blue,
                    size: 150.0,
                  ),
                  Text(
                    '비',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ]));
      } else {
        return Center(
          child: Text('Can\' find weather information'),
        );
      }
    } else {
      return Center(
        child: Text('Loading...'),
      );
    }
  }


  Future<Weather> getWeather() async {
    String key = '856822fd8e22db5e1ba48c0e7d69844a';
    String cityName = 'Busan';
    WeatherFactory wf = WeatherFactory(key);
    Weather weather = await wf.currentWeatherByCityName(cityName);
    setState(() {
      _weatherStr = weather.toString();
    });
    return weather;
  }

}
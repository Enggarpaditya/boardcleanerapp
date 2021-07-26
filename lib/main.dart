import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:boardcleanerapp/controllers/bluetoothController.dart';

import 'package:boardcleanerapp/pages/partPage.dart';
import 'package:boardcleanerapp/pages/voicePage.dart';
import 'package:boardcleanerapp/pages/homePage.dart';
import 'package:boardcleanerapp/pages/imagePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Board Cleaner',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Map<String, Color> colors = {
    'onBorderColor': Colors.green,
    'offBorderColor': Colors.red,
    'neutralBorderColor': Colors.transparent,
    'onTextColor': Colors.green[700],
    'offTextColor': Colors.red[700],
    'neutralTextColor': Colors.blue,
  };

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Avoid memory leak and disconnect

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Home(),
      Part(),
      Voice(),
      Images(),
    ];

    void _onItemTap(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return ChangeNotifierProvider(
        create: (context) => BluetoothController(),
        child: Scaffold(
          /*appBar: AppBar(
        title: Text('Board Cleaner Mobile app'),
      ),*/
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bento_outlined),
                title: Text('Part'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.keyboard_voice_outlined),
                title: Text('Voice'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image_search_outlined),
                title: Text('Image'),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTap,
          ),
        ));
  }
}

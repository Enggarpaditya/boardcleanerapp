import 'package:boardcleanerapp/pages/part.dart';
import 'package:boardcleanerapp/pages/voice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boardcleanerapp/pages/home.dart';
import 'package:boardcleanerapp/pages/image.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

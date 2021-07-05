import 'package:boardcleanerapp/pages/part.dart';
import 'package:boardcleanerapp/pages/voice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boardcleanerapp/pages/home.dart';
import 'package:boardcleanerapp/pages/image.dart';
import 'package:flutter_blue/flutter_blue.dart';

class Nav extends StatefulWidget {
  final BluetoothState state;

  const Nav({Key key, this.state}) : super(key: key);
  @override
  _NavState createState() => _NavState();
}

int _selectedIndex = 0;

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Home(
        state: widget.state,
      ),
      Part(),
      Voice(),
      Images(),
    ];

    void _onItemTap(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

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

import 'package:boardcleanerapp/pages/bluetoothSerial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

// STRUKTUR DASAR
class Home extends StatefulWidget {
  final BluetoothState state;

  const Home({Key key, this.state}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BluetoothSerialPage();
  }
}

import 'package:boardcleanerapp/controllers/bluetoothController.dart';
import 'package:boardcleanerapp/pages/bluetoothSerialPage.dart';
import 'package:flutter/material.dart';

// STRUKTUR DASAR
class Home extends StatefulWidget {
  final BluetoothController bluetooth;
  const Home({Key key, this.bluetooth}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BluetoothSerialPage(bluetooth: widget.bluetooth);
  }
}

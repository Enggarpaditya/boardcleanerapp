import 'package:boardcleanerapp/controllers/bluetoothController.dart';
import 'package:flutter/material.dart';

// STRUKTUR DASAR
class Images extends StatefulWidget {
  final BluetoothController bluetooth;
  const Images({Key key, this.bluetooth}) : super(key: key);
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bagian Image'),
    );
  }
}

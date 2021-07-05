import 'package:flutter/material.dart';
import 'package:boardcleanerapp/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Board Cleaner Mobile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Nav(),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Part extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Part',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _Part(),
    );
  }
}

class _Part extends StatefulWidget {
  @override
  _PartState createState() => _PartState();
}

class _PartState extends State<_Part> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Part'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            //Bagian text
            Text(
              'Pilih bagian yang ingin anda hapus',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            //Bagian Button bagian
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 30.0)),
            Row(
              children: <Widget>[
                FlatButton(
                  color: Colors.blue[300],
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 75),
                  onPressed: () {},
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                ),
                FlatButton(
                  color: Colors.blue[300],
                  child: Text(
                    "2",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 75),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0)),
            Row(
              children: <Widget>[
                FlatButton(
                  color: Colors.blue[300],
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 75),
                  onPressed: () {},
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                ),
                FlatButton(
                  color: Colors.blue[300],
                  child: Text(
                    "4",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 75),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0)),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Bagian yang ingin dihapus',
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0)),
            Row(
              children: <Widget>[
                FlatButton(
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "SEND",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  onPressed: () {},
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                ),
                FlatButton(
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "RESET",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget cardMain(String text, Function function) {
    return InkWell(
      onTap: function,
      child: Card(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 32.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Patrimônio IF",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.error, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/AboutScreen');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
              child: cardMain("Locais", () {
                Navigator.pushNamed(context, '/PlaceScreen');
              }),
            )
          ],
        ),
      ),
    );
  }
}

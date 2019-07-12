import 'package:flutter/material.dart';

class CheckPatrimonyScreen extends StatefulWidget {
  @override
  _CheckPatrimonyScreenState createState() => _CheckPatrimonyScreenState();
}

class _CheckPatrimonyScreenState extends State<CheckPatrimonyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Codigo de Barras"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Container(
        child: Center(
          child: Text("Codigo de Barras"),
        ),
      ),
    );
  }
}
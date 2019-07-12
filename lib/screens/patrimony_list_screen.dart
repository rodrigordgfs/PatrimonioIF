import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatrimonyListScreen extends StatefulWidget {
  @override
  _PatrimonyListScreenState createState() => _PatrimonyListScreenState();
}

class _PatrimonyListScreenState extends State<PatrimonyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrimônio IF'),
        backgroundColor: Colors.green,
        actions: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Ler Patrimônio',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.camera, color: Colors.white,),
        backgroundColor: Colors.green,
        onPressed: () {},
      ),
      body: Container(),
    );
  }
}

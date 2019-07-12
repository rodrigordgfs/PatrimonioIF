import 'package:flutter/material.dart';
import 'package:patrimonio_if/screens/check_patrimony_screen.dart';
import 'package:patrimonio_if/screens/patrimony_list_screen.dart';

void main() => runApp(PatrimonioIF());

class PatrimonioIF extends StatefulWidget {
  @override
  _PatrimonioIFState createState() => _PatrimonioIFState();
}

class _PatrimonioIFState extends State<PatrimonioIF> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patrimônio IF',
      theme: ThemeData(
          primaryColor: Colors.green, primarySwatch: Colors.lightGreen),
      debugShowCheckedModeBanner: false,
      home: PatrimonyListScreen(),
      routes: <String, WidgetBuilder>{
        '/PatrimonyList': (BuildContext context) => new PatrimonyListScreen(),
        '/CheckPatrimony': (BuildContext context) => new CheckPatrimonyScreen()
      },
    );
  }
}

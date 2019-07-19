import 'package:flutter/material.dart';
import 'package:patrimonio_if/screens/about_screen.dart';
import 'package:patrimonio_if/screens/check_patrimony_screen.dart';
import 'package:patrimonio_if/screens/patrimony_list_screen.dart';
import 'package:patrimonio_if/screens/place_screen.dart';

void main() => runApp(PatrimonioIF());

class PatrimonioIF extends StatefulWidget {
  @override
  _PatrimonioIFState createState() => _PatrimonioIFState();
}

class _PatrimonioIFState extends State<PatrimonioIF> {

  static const appTitle = 'Patrimônio IF';
  static const patrimonyList = '/PatrimonyList';
  static const checkPatrimony = '/CheckPatrimony';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
          primaryColor: Colors.green, primarySwatch: Colors.lightGreen),
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      //home: PatrimonyListScreen(),
      home: PlaceScreen(),
=======
      home: AboutScreen(),
>>>>>>> feature/about-screen
      routes: <String, WidgetBuilder>{
        patrimonyList: (BuildContext context) => new PatrimonyListScreen(),
        checkPatrimony: (BuildContext context) => new CheckPatrimonyScreen()
      },
    );
  }
}

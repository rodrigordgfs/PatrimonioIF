import 'package:flutter/material.dart';
import 'package:patrimonio_if/arguments/PatrimonyIDArguments.dart';

class CheckPatrimonyScreen extends StatefulWidget {
  @override
  _CheckPatrimonyScreenState createState() => _CheckPatrimonyScreenState();
}

class _CheckPatrimonyScreenState extends State<CheckPatrimonyScreen> {
  static const routName = '/CheckPatrimony';

  @override
  Widget build(BuildContext context) {
    final PatrimonyIDArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.id),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Container(
        child: Center(),
      ),
    );
  }
}

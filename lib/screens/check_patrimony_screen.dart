import 'package:flutter/material.dart';
import 'package:patrimonio_if/arguments/PatrimonyIDArguments.dart';

class CheckPatrimonyScreen extends StatefulWidget {
  @override
  _CheckPatrimonyScreenState createState() => _CheckPatrimonyScreenState();
}

class _CheckPatrimonyScreenState extends State<CheckPatrimonyScreen> {
  static const routName = '/CheckPatrimony';
  static const objectName = 'Nome do Objeto';

  TextEditingController controlerName = TextEditingController();

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
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Salvar',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
              child: TextField(
                cursorColor: Colors.yellow,
                controller: controlerName,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: objectName,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
                onSubmitted: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.0, 0, 24, 8.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(color: Colors.black38)),
                child: Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

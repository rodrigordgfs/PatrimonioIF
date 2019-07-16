import 'package:flutter/material.dart';
import 'package:patrimonio_if/arguments/PatrimonyIDArguments.dart';

class CheckPatrimonyScreen extends StatefulWidget {
  @override
  _CheckPatrimonyScreenState createState() => _CheckPatrimonyScreenState();
}

class _CheckPatrimonyScreenState extends State<CheckPatrimonyScreen> {
  static const routName = '/CheckPatrimony';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
              child: TextField(
                controller: controlerName,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.local_activity,
                      color: Colors.green,
                    ),
                    hintText: 'Nome do Objeto',
                    border: OutlineInputBorder()),
                onSubmitted: (value) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ImportDataScreen extends StatefulWidget {
  @override
  _ImportDataScreenState createState() => _ImportDataScreenState();
}

class _ImportDataScreenState extends State<ImportDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Importar Dados'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                
              },
              textColor: Colors.white,
              color: Colors.greenAccent,
              child: Text('Procurar Arquivo'),
            )
          ],
        ),
      ),
    );
  }
}
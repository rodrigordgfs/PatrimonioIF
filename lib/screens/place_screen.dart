import 'package:flutter/material.dart';
import 'package:patrimonio_if/arguments/PlaceIDArguments.dart';
import 'package:patrimonio_if/screens/patrimony_list_screen.dart';

class PlaceScreen extends StatefulWidget {
  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  final localArray = [
    'Biblioteca',
    'Sala 741',
    'Sala 884',
    'Laboratório 1',
    'Laboratorio 2',
    'Auditório',
    'Biblioteca',
    'Diretoria',
    'Mini Auditório',
    'Sala 101',
    'Biblioteca',
    'Sala 741',
    'Sala 884',
    'Laboratório 1',
    'Laboratorio 2'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locais',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: localArray.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatrimonyListScreen(),
                      settings: RouteSettings(
                          arguments: PlaceIDArgumnents(localArray[index]))));
            },
            title: Text(
              localArray[index],
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.place, color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}

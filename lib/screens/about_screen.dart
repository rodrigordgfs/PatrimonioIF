import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

Widget aboutTile(String title, String subtitle, IconData icon, Function event) {
  return ListTile(
    title: Text(title, style: TextStyle(fontWeight: FontWeight.w300)),
    subtitle: Text(subtitle, style: TextStyle(fontWeight: FontWeight.w300)),
    leading: Icon(icon),
    onTap: event,
  );
}

class _AboutScreenState extends State<AboutScreen> {
  var filePath = '';

  void toast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _showDialog(String title, String content, Function function) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title, style: TextStyle(fontWeight: FontWeight.w400)),
            content:
                Text(content, style: TextStyle(fontWeight: FontWeight.w300)),
            actions: <Widget>[
              FlatButton(
                child: Text("Continuar",
                    style: TextStyle(fontWeight: FontWeight.w300)),
                onPressed: function,
              ),
              FlatButton(
                child: Text("Cancelar",
                    style: TextStyle(fontWeight: FontWeight.w300)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sobre"),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Patrimônio IF",
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      subtitle: Text("© 2019 Shinoda Labs",
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.offline_bolt, color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    aboutTile("Versão", "1.0.0", Icons.verified_user, () {}),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Autores",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    aboutTile("Rodrigo Shinoda", "Desenvolvedor", Icons.person,
                        () {}),
                    aboutTile(
                        "Diego Ulguim", "Desenvolvedor", Icons.person, () {}),
                    aboutTile("Matheus Jung", "Coordenador",
                        Icons.person_outline, () {})
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 24.0),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Dados",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    aboutTile(
                        "Arquivo", "patrimonio.csv", Icons.description, () {}),
                    aboutTile("Quantidade de Itens", "1524",
                        Icons.filter_9_plus, () {}),
                    aboutTile("Data de Improtação", "22/07/2019",
                        Icons.calendar_today, () {}),
                    aboutTile("Importar Dados", "Clique aqui para importar",
                        Icons.file_upload, () {
                      _showDialog("Importa Dados",
                          "Ao importados os dados, caso já haja dados importados, serão sobreescrevidos!",
                          () async {
                        Navigator.of(context).pop();
                        filePath = await FilePicker.getFilePath(
                            type: FileType.CUSTOM, fileExtension: 'csv');
                        if (filePath != "") {
                          toast(filePath, Colors.blue);
                        }
                      });
                    })
                  ],
                ),
              ),
            )
          ],
        )));
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

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
  var _qtd_itens = 0;
  var _data_importacao = '';

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
                    style: TextStyle(fontWeight: FontWeight.w400)),
                onPressed: function,
              ),
              FlatButton(
                child: Text("Cancelar",
                    style: TextStyle(fontWeight: FontWeight.w400)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _getCSVData(String path) {
    var count = 0;
    final File file = new File(path);

    Stream<List> inputStream = file.openRead();

    inputStream.transform(utf8.decoder).transform(new LineSplitter()).listen(
        (String line) {
      if (count != 0) {
        List row = line.split(';');
        String id = row[0];
        String numero = row[1];
        String status = row[2];
        String ed = row[3];
        String descricao = row[4];
        String rotulos = row[5];
        String carga_atual = row[6];
        String setor_do_responsavel = row[7];
        String campus_da_carga = row[8];
        String valor_aquisicao = row[9];
        String valor_depreciado = row[10];
        String numero_nota_fiscal = row[11];
        String numero_de_Serie = row[12];
        String data_entrada = row[13];
        String data_carga = row[14];
        String fornecedor = row[15];
        String sala = row[16];
        String estado_conservacao = row[17];
      }
      count++;
    }, onDone: () {
      toast("Dados Carregados com Sucesso\nQuantidade: ${count}", Colors.green);
    }, onError: (e) {
      toast(e.toString(), Colors.red);
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
                    aboutTile("Quantidade de Itens", _qtd_itens.toString(),
                        Icons.filter_9_plus, () {}),
                    aboutTile("Data de Improtação", _data_importacao != '' ? _data_importacao: null,
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
                          _getCSVData(filePath);
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

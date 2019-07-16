import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:patrimonio_if/arguments/PatrimonyIDArguments.dart';
import 'package:patrimonio_if/screens/check_patrimony_screen.dart';

class PatrimonyListScreen extends StatefulWidget {
  @override
  _PatrimonyListScreenState createState() => _PatrimonyListScreenState();
}

class _PatrimonyListScreenState extends State<PatrimonyListScreen> {
  static const appTitle = 'Patrimônio IF';
  static const readPatrimony = 'Ler Patrimônio';

  final barcodeArray = [
    '789860145001',
    '789860145002',
    '789860145003',
    '789860145004',
    '789860145005',
    '789860145006',
    '789860145007',
    '789860145008',
    '789860145009',
    '7898601450010',
    '7898601450011',
    '7898601450012',
    '7898601450013',
    '7898601450014',
    '7898601450015'
  ];

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

  final nomeArray = [
    'Livro PHP',
    'Cadeira',
    'Classe',
    'Computador',
    'Estabilizador',
    'Projetor',
    'Macintosh',
    'Escrivaninha',
    'Mesa',
    'Quadro Branco',
    'Livro PHP',
    'Cadeira',
    'Classe',
    'Computador',
    'Estabilizador'
  ];

  String barcode = "";

  Future _scanBarCode() async {
    try {
      String barcodeResult = await BarcodeScanner.scan();
      setState(() {
        barcode = barcodeResult;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CheckPatrimonyScreen(),
                settings: RouteSettings(
                    arguments: PatrimonyIDArguments(barcodeResult))));
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          barcode = "Permissão da câmera negada";
        });
      } else {
        setState(() {
          barcode = "Erro $e";
        });
      }
    } on FormatException {
      setState(() {
        barcode = "Leitura Cancelada";
      });
    } catch (e) {
      setState(() {
        barcode = "Erro $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          readPatrimony,
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.camera,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          _scanBarCode();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: Center(
          child: ListView.builder(
            itemCount: barcodeArray.length,
            itemBuilder: (context, index) {
              return ListTile(
                  onTap: () {},
                  title: Text(barcodeArray[index]),
                  trailing: Text(localArray[index]),
                  subtitle: Text(nomeArray[index]),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.done),
                  ));
            },
          ),
        ),
      ),
    );
  }
}

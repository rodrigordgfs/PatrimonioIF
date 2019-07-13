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
        title: Text('Patrimônio IF'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Ler Patrimônio',
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
          child: Text("Em Breve"),
        ),
      ),
    );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:patrimonio_if/arguments/PatrimonyIDArguments.dart';
import 'package:patrimonio_if/arguments/PlaceIDArguments.dart';
import 'package:patrimonio_if/screens/check_patrimony_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PatrimonyListScreen extends StatefulWidget {
  @override
  _PatrimonyListScreenState createState() => _PatrimonyListScreenState();
}

class _PatrimonyListScreenState extends State<PatrimonyListScreen>
    with SingleTickerProviderStateMixin {
  static const routName = '/PatrimonyList';
  static const appTitle = 'Patrimônio IF';
  static const readPatrimony = 'Ler Patrimônio';
  static const verified = 'Verificado';
  static const notVerified = 'Não Verificado';

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

  TabController _tabController;

  Future _scanBarCode() async {
    try {
      String barcodeResult = await BarcodeScanner.scan();
      setState(() {
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
          toast('Permissão da câmera negada', Colors.red);
        });
      } else {
        setState(() {
          toast("Erro $e", Colors.red);
        });
      }
    } on FormatException {
      setState(() {
        toast('Leitura Cancelada', Colors.blue);
      });
    } catch (e) {
      setState(() {
        toast('Erro $e', Colors.red);
      });
    }
  }

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }


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

  @override
  Widget build(BuildContext context) {
    final PlaceIDArgumnents args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.yellow,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.yellow,
          tabs: <Widget>[
            new Tab(
              text: verified,
            ),
            new Tab(
              text: notVerified,
            )
          ],
        ),
        bottomOpacity: 1,
        title: Text(args.id,
                        style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          readPatrimony,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          Container(
            child: Center(
              child: ListView.builder(
                itemCount: barcodeArray.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    actions: <Widget>[
                      IconSlideAction(
                          caption: 'Editar',
                          color: Colors.blueAccent,
                          icon: Icons.edit,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CheckPatrimonyScreen(),
                                    settings: RouteSettings(
                                        arguments: PatrimonyIDArguments(
                                            barcodeArray[index]))));
                          })
                    ],
                    child: ListTile(
                        onTap: () {},
                        title: Text(barcodeArray[index],
                        style: TextStyle(fontWeight: FontWeight.w300)),
                        trailing: Text(
                          localArray[index],
                        style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        subtitle: Text(nomeArray[index],
                        style: TextStyle(fontWeight: FontWeight.w300)),
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                        )),
                  );
                },
              ),
            ),
          ),
          Container(
            child: Center(
              child: ListView.builder(
                itemCount: barcodeArray.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {},
                      title: Text(barcodeArray[index],
                        style: TextStyle(fontWeight: FontWeight.w300)),
                      trailing: Text(localArray[index],
                        style: TextStyle(fontWeight: FontWeight.w300)),
                      subtitle: Text(nomeArray[index],
                        style: TextStyle(fontWeight: FontWeight.w300)),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(Icons.close, color: Colors.white),
                      ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

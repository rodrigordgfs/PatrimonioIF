import 'package:flutter/material.dart';
import 'package:patrimonio_if/arguments/PatrimonyIDArguments.dart';

class CheckPatrimonyScreen extends StatefulWidget {
  @override
  _CheckPatrimonyScreenState createState() => _CheckPatrimonyScreenState();
}

class _CheckPatrimonyScreenState extends State<CheckPatrimonyScreen> {
  static const routName = '/CheckPatrimony';

  TextEditingController controlerName = TextEditingController();
  TextEditingController controlerStatus = TextEditingController();
  TextEditingController controlerDescricao = TextEditingController();
  TextEditingController controlerEdicao = TextEditingController();
  TextEditingController controlerValor = TextEditingController();
  TextEditingController controlerData = TextEditingController();
  TextEditingController controlerLocal = TextEditingController();
  TextEditingController controlerEstado = TextEditingController();

  Widget _editText(String label, TextEditingController controller, {String prefix = '', TextInputType inputType = TextInputType.text}) {
    return TextField(
      cursorColor: Colors.yellow,
      controller: controller,
      keyboardType: inputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefix: Text(prefix),
          labelText: label,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PatrimonyIDArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.id,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
          backgroundColor: Colors.green,
          centerTitle: true,
          actions: <Widget>[],
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            'Salvar',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          icon: Icon(
            Icons.save,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                  child: _editText('Nome do Objeto', controlerName),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                  child: _editText('Status', controlerStatus),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                  child: _editText('Descrição', controlerDescricao),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                  child: _editText('Edição', controlerEdicao),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                  child: _editText('Valor de Aquisição', controlerValor, prefix: 'R\$', inputType: TextInputType.number),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                  child: _editText('Data de Entrada', controlerData),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                  child: _editText('Local', controlerLocal),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                  child: _editText('Estado do Objeto', controlerEstado),
                ),
              ],
            ),
          ),
        ));
  }
}

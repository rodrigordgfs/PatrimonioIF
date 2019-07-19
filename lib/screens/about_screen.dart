import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Card(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Patrimônio IF", style: TextStyle(fontWeight: FontWeight.w300)),
                    subtitle: Text("© 2019 Shinoda Labs", style: TextStyle(fontWeight: FontWeight.w300)),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.offline_bolt, color: Colors.white),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Versão", style: TextStyle(fontWeight: FontWeight.w300)),
                    subtitle: Text("1.0.0", style: TextStyle(fontWeight: FontWeight.w300)),
                    leading: Icon(Icons.verified_user),
                    onTap: () {},
                  )
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
                    title: Text("Autores", style: TextStyle(fontWeight: FontWeight.w500),),
                  ),
                  ListTile(
                    title: Text("Rodrigo Shinoda", style: TextStyle(fontWeight: FontWeight.w300)),
                    subtitle: Text("Desenvolvedor", style: TextStyle(fontWeight: FontWeight.w300)),
                    leading: Icon(Icons.person),
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text("Diego Ulguim", style: TextStyle(fontWeight: FontWeight.w300)),
                    subtitle: Text("Desenvolvedor", style: TextStyle(fontWeight: FontWeight.w300)),
                    leading: Icon(Icons.person),
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text("Matheus Jung", style: TextStyle(fontWeight: FontWeight.w300)),
                    subtitle: Text("Coordenador", style: TextStyle(fontWeight: FontWeight.w300)),
                    leading: Icon(Icons.person_outline),
                    onTap: (){},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

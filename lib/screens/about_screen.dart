import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
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
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  aboutTile("Rodrigo Shinoda", "Desenvolvedor", Icons.person, () {}),
                  aboutTile("Diego Ulguim", "Desenvolvedor", Icons.person, () {}),
                  aboutTile("Matheus Jung", "Coordenador", Icons.person_outline, () {})
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

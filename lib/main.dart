import 'package:flutter/material.dart';
import 'package:flutterteste/database/app_database.dart';
import 'package:flutterteste/telas/dashboard.dart';
import 'modelos/contato.dart';

void main() {
  runApp(TesteAppPersistencia());
  save(Contato(1, 'jeovane', 1000)).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}

class TesteAppPersistencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}

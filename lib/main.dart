import 'package:flutter/material.dart';
import 'package:flutterteste/database/app_database.dart';
import 'package:flutterteste/telas/dashboard.dart';
import 'modelos/contato.dart';

void main() {
  runApp(TesteAppPersistencia());
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

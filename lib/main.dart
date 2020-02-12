import 'package:flutter/material.dart';
import 'package:flutterteste/telas/transferencia/lista.dart';

void main() => runApp(TesteApp());

// WIDGET RELACIONADO APENAS AO APP, ABSTRAÇÃO AO MAXIMO
class TesteApp extends StatelessWidget {
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
      home: ListaTransferencias(),
    );
  }
}

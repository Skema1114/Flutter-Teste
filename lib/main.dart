import 'package:flutter/material.dart';

void main() => runApp(TesteAppPersistencia());

// WIDGET RELACIONADO APENAS AO APP, ABSTRAÇÃO AO MAXIMO
class TesteAppPersistencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
      ),
    );
  }
}

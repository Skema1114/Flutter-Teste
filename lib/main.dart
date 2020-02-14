import 'dart:ui';

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
        body: Column(
          children: <Widget>[
            Image.asset('images/empresa_logo.png'),
            Container(
              height: 120,
              width: 100,
              color: Colors.purple,
              child: Column(
                children: <Widget>[
                  Icon(Icons.people),
                  Text('Contatos')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

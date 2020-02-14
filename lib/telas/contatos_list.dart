import 'package:flutter/material.dart';
import 'package:flutterteste/modelos/texto.dart';
import 'package:flutterteste/telas/contatos_form.dart';

class ContatosList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomeTelaListContato),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Alex',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContatosForm(),
            ),
            //pegou o novo contato que foi mandado do form
          ).then((novoContato) => debugPrint(novoContato.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

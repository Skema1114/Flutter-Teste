import 'package:flutter/material.dart';
import 'package:flutterteste/database/dao/contato_dao.dart';
import 'package:flutterteste/modelos/contato.dart';
import 'package:flutterteste/modelos/texto.dart';
import 'package:flutterteste/telas/contatos_form.dart';

class ContatosList extends StatelessWidget {
  final ContatoDAO _contatoDAO = ContatoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomeTelaListContato),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 1)).then((value) => _contatoDAO.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;

            case ConnectionState.waiting:
              // TODO: Handle this case.
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading...')
                  ],
                ),
              );
              break;

            case ConnectionState.active:
              // TODO: Handle this case.
              break;

            case ConnectionState.done:
              // TODO: Handle this case.
              final List<Contato> contatos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contato = contatos[index];
                  return _ItemContato(contato);
                },
                itemCount: contatos.length,
              );
              break;
          }
          return Text('Erro desconhecido!');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContatosForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ItemContato extends StatelessWidget {
  final Contato contato;

  _ItemContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contato.numeroConta.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

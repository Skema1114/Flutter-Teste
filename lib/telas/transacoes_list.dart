import 'package:flutterteste/modelos/transacao.dart';
import 'package:flutterteste/modelos/contato.dart';
import 'package:flutterteste/modelos/texto.dart';
import 'package:flutter/material.dart';

class TransacoesList extends StatelessWidget {
  final List<Transacao> transacoes = List();

  @override
  Widget build(BuildContext context) {
    transacoes.add(Transacao(100.0, Contato(0, 'Alex', 1000)));
    return Scaffold(
      appBar: AppBar(
        title: Text(containerTextTransacao),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Transacao transacao = transacoes[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(
                transacao.valor.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transacao.contato.numeroConta.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
        itemCount: transacoes.length,
      ),
    );
  }
}

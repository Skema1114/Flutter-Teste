import 'package:flutter/material.dart';
import 'package:flutterteste/database/app_database.dart';
import 'package:flutterteste/modelos/contato.dart';
import 'package:flutterteste/modelos/texto.dart';

class ContatosForm extends StatefulWidget {
  @override
  _ContatosFormState createState() => _ContatosFormState();
}

class _ContatosFormState extends State<ContatosForm> {
  final TextEditingController _nomeController = TextEditingController();

  final TextEditingController _numeroContaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomeTelaFormContatos),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: textFieldRotuloNome,
                ),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            TextField(
              controller: _numeroContaController,
              decoration: InputDecoration(
                labelText: textFieldRotuloNumero,
              ),
              style: TextStyle(
                fontSize: 16.0,
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                // essa linha é a que preenche toda a tela caso precise,
                // so envolver o elemento em um SizedBox
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text(raisedButtonRotuloCriar),
                  onPressed: () {
                    // pegando o que é digitado nos campos por meio do controller
                    final String nome = _nomeController.text;
                    final int numeroConta =
                        int.tryParse(_numeroContaController.text);
                    //criando uma instancia do contato e adicionando os valores
                    //trocando de tela e enviando os dados, ou seja, um novo contato
                    final Contato novoContato = Contato(0, nome, numeroConta);
                    save(novoContato)
                        .then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

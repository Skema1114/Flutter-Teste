import 'package:flutterteste/telas/transacoes_list.dart';
import 'package:flutterteste/telas/contatos_list.dart';
import 'package:flutterteste/modelos/texto.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomeTelaDashboard),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/empresa_logo.png'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _ItemMenu(
                  containerTextTransferencia,
                  Icons.monetization_on,
                  espaco: EdgeInsets.all(8.0),
                  onClick: () => _showProximaTela(context, ContatosList()),
                ),
                _ItemMenu(
                  containerTextTransacao,
                  Icons.description,
                  espaco: EdgeInsets.all(0.0),
                  onClick: () => _showProximaTela(context, TransacoesList()),
                ),
                _ItemMenu(
                  containerTextTeste,
                  Icons.fingerprint,
                  espaco: EdgeInsets.all(8.0),
                  onClick: () => print('Este é um Teste!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showProximaTela(BuildContext context, Widget tela) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => tela,
    ),
  );
}

class _ItemMenu extends StatelessWidget {
  final String nome;
  final IconData icone;
  final Function onClick;
  final EdgeInsets espaco;

  _ItemMenu(this.nome, this.icone, {@required this.onClick, this.espaco});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: espaco,
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icone,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  nome,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

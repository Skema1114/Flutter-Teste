import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterteste/modelos/texto.dart';
import 'package:flutterteste/modelos/transferencia.dart';
import 'package:flutterteste/telas/transferencia/formulario.dart';

// LISTA DE TRANSFERENCIAS
class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

// WIDGET DO STATE QUE LISTARÁ AS TRANSFERENCIAS
class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tituloAppBarLista),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferenciaRecebida) {
            _atualiza(transferenciaRecebida);
          });
        },
      ),
    );
  }

  // FUNÇÃO GERADA PARA RECEBER E ATUALIZAR A TELA DE LIST
  void _atualiza(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

// ITEM TRANSFERENCIA UTILIZANDO A TRANSFERENCIA
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

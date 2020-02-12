import 'package:flutter/material.dart';
import 'package:flutterteste/componentes/editor.dart';
import 'package:flutterteste/modelos/texto.dart';
import 'package:flutterteste/modelos/transferencia.dart';

// FORMULÁRIO DAS TRANSFERENCIAS
class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

// WIDGET STATE PARA O FORMULARIO DE TRANSFERENCIAS
class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tituloAppBarFormulario),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: rotuloCampoNumeroConta,
              dica: dicaCampoNumeroConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: rotuloCampoValor,
              dica: dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () {
                _criaTransferencia(context);
              },
              child: Text(textoBotaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
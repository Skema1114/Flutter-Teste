import 'package:flutterteste/modelos/contato.dart';

class Transacao {
  final double valor;
  final Contato contato;

  Transacao(this.valor, this.contato);

  @override
  String toString() {
    return 'Transacao{valor: $valor, contato: $contato}';
  }
}

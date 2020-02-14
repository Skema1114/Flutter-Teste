class Contato{
  final int id;
  final String nome;
  final int numeroConta;

  Contato(this.id, this.nome, this.numeroConta);

  @override
  String toString() {
    return 'Contato{nome: $nome, numeroConta: $numeroConta}';
  }
}
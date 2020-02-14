import 'package:flutterteste/modelos/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((caminhoBanco) {
    final String path = join(caminhoBanco, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contatos ('
          'id INTEGER PRIMARY KEY,'
          'nome TEXT,'
          'numero_conta INTEGER');
    }, version: 1);
  });
}

void save(Contato contato) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap['id'] = contato.id;
    contatoMap['nome'] = contato.nome;
    contatoMap['numero_conta'] = contato.numeroConta;
    return db.insert('contatos', contatoMap);
  });
}
import 'package:flutterteste/modelos/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('CREATE TABLE contatos('
            'id INTEGER PRIMARY KEY, '
            'nome TEXT, '
            'numero_conta INTEGER)');
      },
      version: 1,
      //essa linha limpa o banco caso volte a vesão do banco de dados
      //sendo assim, versão 2 e roda, volta a versão e rosa que ele vai zerar

      // onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(Contato con) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['nome'] = con.nome;
    contactMap['numero_conta'] = con.numeroConta;
    return db.insert('contatos', contactMap);
  });
}

Future<List<Contato>> findAll() {
  return createDatabase().then((db) {
    return db.query('contatos').then((maps) {
      final List<Contato> contatos = List();
      for (Map<String, dynamic> map in maps) {
        final Contato con = Contato(
          map['id'],
          map['nome'],
          map['numero_conta'],
        );
        contatos.add(con);
      }
      return contatos;
    });
  });
}

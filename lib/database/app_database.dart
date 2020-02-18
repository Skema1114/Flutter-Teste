import 'package:flutterteste/modelos/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'numero_conta INTEGER)');
    },
    version: 1,
    //essa linha limpa o banco caso volte a vesão do banco de dados sendo assim, versão 2 e roda, volta a versão e rosa que ele vai zerar
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> save(Contato con) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contatoMap = Map();

  contatoMap['nome'] = con.nome;
  contatoMap['numero_conta'] = con.numeroConta;

  return db.insert('contatos', contatoMap);
}

Future<List<Contato>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> resutado = await db.query('contatos');
  final List<Contato> contatos = List();

  for (Map<String, dynamic> row in resutado) {
    final Contato con = Contato(
      row['id'],
      row['nome'],
      row['numero_conta'],
    );
    contatos.add(con);
  }
  return contatos;
}

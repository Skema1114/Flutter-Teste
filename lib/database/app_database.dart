import 'package:flutterteste/database/dao/contato_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDAO.tableSqlContato);
    },
    version: 1,
    //essa linha limpa o banco caso volte a vesão do banco de dados sendo assim, versão 2 e roda, volta a versão e rosa que ele vai zerar
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}

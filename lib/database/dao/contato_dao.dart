import 'package:sqflite/sqflite.dart';
import 'package:flutterteste/modelos/contato.dart';
import 'package:flutterteste/database/app_database.dart';

class ContatoDAO{
  static const String _nomeTabela = 'contatos';

  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numero_conta';

  static const String tableSqlContato = 'CREATE TABLE $_nomeTabela('
                                          '$_id INTEGER PRIMARY KEY,'
                                          '$_nome TEXT,'
                                          '$_numeroConta INTEGER)';


  Future<int> save(Contato con) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contatoMap = _toMap(con);

    return db.insert(_nomeTabela, contatoMap);
  }


  Future<List<Contato>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resutado = await db.query(_nomeTabela);

    List<Contato> contatos = _toList(resutado);

    return contatos;
  }

  
  Map<String, dynamic> _toMap(Contato con) {
    final Map<String, dynamic> contatoMap = Map();

    contatoMap[_nome] = con.nome;
    contatoMap[_numeroConta] = con.numeroConta;

    return contatoMap;
  }


  List<Contato> _toList(List<Map<String, dynamic>> resutado) {
    final List<Contato> contatos = List();

    for (Map<String, dynamic> row in resutado) {
      final Contato con = Contato(
        row[_id],
        row[_nome],
        row[_numeroConta],
      );
      contatos.add(con);
    }
    return contatos;
  }
}
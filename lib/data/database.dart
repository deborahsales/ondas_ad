import 'package:postgres/postgres.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'ondas_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'video.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(OndasDao.tableSql);
    },
    version: 1,
  );
}

class PostgresDatabase {
  late final Connection connection;

  Future<void> initialize() async {
    try {
      connection = await Connection.open(Endpoint(
        host: 'kesavan.db.elephantsql.com',
        database: 'knsywgwu',
        username: 'knsywgwu',
        password: 'i_U9_JjU5SOH3LvA_cJSShwxrgUPe6BA',
      ));
    } catch (error) {
      print('Erro de conexão ao banco de dados: $error');
    }
  }

  Future<List<Map<String, dynamic>>> queryByModuloAno(
      String modulo, String ano) async {
    final result = await connection.execute(
      Sql.named(
          'SELECT titulo, link FROM ondas.videos WHERE modulo = @modulo AND ano = @ano'),
      parameters: {'modulo': modulo, 'ano': ano},
    );
    return result.toList().map((row) => row.toColumnMap()).toList();
  }
}

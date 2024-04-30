import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'ondas_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'video.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(OndasDao.tableSql);
      db.execute(OndasDao.table2Sql);
      db.execute(OndasDao.table3Sql);
    },
    version: 1,
  );
}
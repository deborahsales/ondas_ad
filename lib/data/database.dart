import 'dart:io';
import 'package:http/http.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'ondas_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'ondas.db');
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

Future<void> deleteDatabase() async {
  final String path = join(await getDatabasesPath(), 'ondas.db');
  if (await File(path).exists()) {
    await delete(Uri.parse(path)); // Convert path to Uri
  }
}
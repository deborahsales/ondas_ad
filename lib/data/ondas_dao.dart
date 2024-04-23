import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import '../components/podcast.dart';
import '../components/video_aula.dart';
import 'database.dart';
import 'dart:async';

class OndasDao {
  static const String tableSql = ' CREATE TABLE $_tableName('
      '$_versao TEXT, '
      '$_tipo TEXT, '
      '$_ano TEXT, '
      '$_modulo TEXT, '
      '$_titulo TEXT, '
      '$_videoId TEXT, '
      '$_podcastLink TEXT)';

  static const String _versao = 'versao';
  static const String _tipo = 'tipo';
  static const String _ano = 'ano';
  static const String _modulo = 'modulo';
  static const String _titulo = 'titulo';
  static const String _videoId = 'videoId';
  static const String _podcastLink = 'podcastLink';
  static const String _tableName = 'videoTable';

  Future<void> insertDataFromCSV() async {
    final String csvString = await rootBundle.loadString('assets/ondas_bd.csv');
    final List<List<dynamic>> csvData =
        const CsvToListConverter().convert(csvString);
    final Database database = await getDatabase();
    var itemExists = await getModuloAno('Módulo 01', '1 e 2', '');

    if (itemExists.isEmpty) {
      await database.transaction((txn) async {
        for (final row in csvData) {
          final Map<String, dynamic> resourcesMap = {
            _versao: row[0],
            _tipo: row[1],
            _ano: row[2],
            _modulo: row[3],
            _titulo: row[4],
            _videoId: row[5],
            _podcastLink: row[6],
          };
          await txn.insert(_tableName, resourcesMap);
        }
      });
    }
    await database.close();
  }

  Future<List<VideoAula>> getModuloAno(
      String modulo, String ano, String image) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
        _tableName,
        where: '$_versao = ? AND $_tipo = ? AND $_ano = ? AND $_modulo = ?',
        whereArgs: ['2.0', 'video', ano, modulo]);
    return toListVideo(result, image);
  }

  Future<List<Podcast>> getPodcast(
      String versao, String modulo, String image) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
        _tableName,
        where: '$_versao = ? AND $_tipo = ? AND $_modulo = ?',
        whereArgs: [versao, 'podcast', modulo]);
    return toListPodcast(result, image);
  }

  List<Podcast> toListPodcast(
      List<Map<String, dynamic>> mapaResultados, String image) {
    final List<Podcast> resultados = [];
    for (Map<String, dynamic> linha in mapaResultados) {
      String titulo = linha['titulo'];
      String podcastLink = linha['podcastLink'];
      final Podcast resultado = Podcast(
        titulo: titulo,
        image: image,
        podcastLink: podcastLink,
      );
      resultados.add(resultado);
    }
    return resultados;
  }

  List<VideoAula> toListVideo(
      List<Map<String, dynamic>> mapaResultados, String image) {
    final List<VideoAula> resultados = [];
    for (Map<String, dynamic> linha in mapaResultados) {
      String titulo = linha['titulo'];
      String videoId = linha['videoId'];
      final VideoAula resultado = VideoAula(
        titulo: titulo,
        image: image,
        videoId: videoId,
      );
      resultados.add(resultado);
    }
    return resultados;
  }

  static const List<String> moduloList = <String>[
    'Módulo 01',
    'Módulo 02',
    'Módulo 03',
    'Módulo 04',
    'Módulo 05',
    'Módulo 06',
    'Módulo 07',
    'Módulo 08',
  ];
}

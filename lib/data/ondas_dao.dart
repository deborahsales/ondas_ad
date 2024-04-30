import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import '../components/podcast.dart';
import '../components/resultado.dart';
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

  static const String table2Sql = ' CREATE TABLE $_table2Name('
      '$_componente TEXT, '
      '$_anoPlanilha TEXT, '
      '$_habilidade TEXT, '
      '$_descricao TEXT, '
      '$_ondas TEXT, '
      '$_agrupamento TEXT, '
      '$_moduloOndas TEXT, '
      '$_aulaOndas TEXT, '
      '$_paginaCaderno TEXT, '
      '$_aulaPF TEXT, '
      '$_sugestoes TEXT, '
      '$_complementar TEXT)';

  static const String table3Sql = ' CREATE TABLE $_table3Name('
      '$_componente TEXT, '
      '$_anoPlanilha TEXT, '
      '$_habilidade TEXT, '
      '$_descricao TEXT, '
      '$_ondas TEXT, '
      '$_agrupamento TEXT, '
      '$_moduloOndas TEXT, '
      '$_aulaOndas TEXT, '
      '$_paginaCaderno TEXT, '
      '$_aulaPF TEXT, '
      '$_sugestoes TEXT, '
      '$_complementar TEXT)';

  static const String _componente = 'componente';
  static const String _anoPlanilha = 'anoPlanilha';
  static const String _habilidade = 'habilidade';
  static const String _descricao = 'descricao';
  static const String _ondas = 'ondas';
  static const String _agrupamento = 'agrupamento';
  static const String _moduloOndas = 'moduloOndas';
  static const String _aulaOndas = 'aulaOndas';
  static const String _paginaCaderno = 'paginaCaderno';
  static const String _aulaPF = 'aulaPF';
  static const String _sugestoes = 'sugestoes';
  static const String _complementar = 'complementar';
  static const String _table2Name = 'componenteTable';
  static const String _table3Name = 'habilidadeTable';

  Future<void> insertDataFromCSV() async {

    final Database database = await getDatabase();

    final String csvString = await rootBundle.loadString('assets/ondas_bd.csv');
    final List<List<dynamic>> csvData = const CsvToListConverter().convert(csvString);
    var itemExists = await database.query(_tableName);

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

    final String csvString2 = await rootBundle.loadString('assets/componente_bd.csv');
    final List<List<dynamic>> csvData2 = const CsvToListConverter().convert(csvString2);
    var itemExists2 = await database.query(_table2Name);

    if (itemExists2.isEmpty) {
      await database.transaction((txn) async {
        for (final row in csvData2) {
          final Map<String, dynamic> resourcesMap = {
            _componente: row[0],
            _anoPlanilha: row[1],
            _habilidade: row[2],
            _descricao: row[3],
            _ondas: row[4],
            _agrupamento: row[5],
            _moduloOndas: row[6],
            _aulaOndas: row[7],
            _paginaCaderno: row[8],
            _aulaPF: row[9],
            _sugestoes: row[10],
            _complementar: row[11],
          };
          await txn.insert(_table2Name, resourcesMap);
        }
      });
    }

    final String csvString3 = await rootBundle.loadString('assets/habilidade_bd.csv');
    final List<List<dynamic>> csvData3 = const CsvToListConverter().convert(csvString3);
    var itemExists3 = await database.query(_table3Name);

    if (itemExists3.isEmpty) {
      await database.transaction((txn) async {
        for (final row in csvData3) {
          final Map<String, dynamic> resourcesMap = {
            _componente: row[0],
            _anoPlanilha: row[1],
            _habilidade: row[2],
            _descricao: row[3],
            _ondas: row[4],
            _agrupamento: row[5],
            _moduloOndas: row[6],
            _aulaOndas: row[7],
            _paginaCaderno: row[8],
            _aulaPF: row[9],
            _sugestoes: row[10],
            _complementar: row[11],
          };
          await txn.insert(_table3Name, resourcesMap);
        }
      });
    }

    await database.close();
  }

  Future<List<Resultado>> getComponenteAno(
      String componente, String anoPlanilha) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
        _table2Name,
        where: '$_componente = ? AND $_anoPlanilha = ?',
        whereArgs: [componente, anoPlanilha]);
    return toListComponenteAno(result);
  }

  Future<List<Resultado>> getHabilidade(String habilidade) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database
        .query(_table3Name, where: '$_habilidade = ?', whereArgs: [habilidade]);
    return toListHabilidade(result);
  }

  Future<String> getDescricao(String habilidade) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
        _table3Name,
        columns: [_descricao],
        distinct: true,
        where: '$_habilidade = ?',
        whereArgs: [habilidade]);

    return result[0][_descricao];
  }

  Future<List<VideoAula>> getModuloAno(
      String modulo, String ano, String image) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
        _tableName,
        where: '$_versao = ? AND $_tipo = ? AND $_ano = ? AND $_modulo = ?',
        whereArgs: ['2.0', 'video', ano, modulo]);
    return toListVideo(result, image);
  }

  Future<List<Podcast>> getPodcast(
      String versao, String ano, String modulo, String image) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
        _tableName,
        where: '$_versao = ? AND $_ano = ? AND $_tipo = ? AND $_modulo = ?',
        whereArgs: [versao, ano, 'podcast', modulo]);
    return toListPodcast(result, image);
  }

  List<Resultado> toListComponenteAno(List<Map<String, dynamic>> mapaResultados) {
    final List<Resultado> resultados = [];
    for (Map<String, dynamic> linha in mapaResultados) {
      String habilidade = linha['habilidade'];
      String descricao = linha['descricao'];
      String ondas = linha['ondas'];
      String agrupamento = linha['agrupamento'];
      String moduloOndas = linha['moduloOndas'];
      String aulaOndas = linha['aulaOndas'];
      String paginaCaderno = linha['paginaCaderno'];
      String aulaPF = linha['aulaPF'];
      String sugestoes = linha['sugestoes'];
      String complementar = linha['complementar'];

      String tituloUm = 'Ondas $ondas - $agrupamento ano';
      String tituloDois = '$moduloOndas - $aulaOndas - Páginas: $paginaCaderno';
      String dadosUm = 'Habilidade [$habilidade] - $descricao';
      String dadosDois = 'Unidade ProFuturo: $aulaPF';
      String dadosExpandidos = '$complementar\n\nSugestão: $sugestoes';

      final Resultado resultado = Resultado(
        tituloUm: tituloUm,
        tituloDois: tituloDois,
        dadosUm: dadosUm,
        dadosDois: dadosDois,
        dadosExpandidos: dadosExpandidos,
      );
      resultados.add(resultado);
    }
    return resultados;
  }

  List<Resultado> toListHabilidade(List<Map<String, dynamic>> mapaResultados) {
    final List<Resultado> resultados = [];
    for (Map<String, dynamic> linha in mapaResultados) {
      String ondas = linha['ondas'];
      String agrupamento = linha['agrupamento'];
      String moduloOndas = linha['moduloOndas'];
      String aulaOndas = linha['aulaOndas'];
      String paginaCaderno = linha['paginaCaderno'];
      String aulaPF = linha['aulaPF'];
      String sugestoes = linha['sugestoes'];
      String complementar = linha['complementar'];

      String tituloUm = 'Ondas $ondas - $agrupamento ano';
      String tituloDois = '$moduloOndas - $aulaOndas - Páginas: $paginaCaderno';
      String dadosUm = complementar;
      String dadosDois = 'Unidade ProFuturo: $aulaPF';
      String dadosExpandidos = 'Sugestão: $sugestoes';

      final Resultado resultado = Resultado(
        tituloUm: tituloUm,
        tituloDois: tituloDois,
        dadosUm: dadosUm,
        dadosDois: dadosDois,
        dadosExpandidos: dadosExpandidos,
      );
      resultados.add(resultado);
    }
    return resultados;
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

  static const List<String> anoList = <String>[
    '1º e 2º anos',
    '3º ano',
    '4º e 5º anos',
  ];

  static const List<String> componenteList = <String>[
    'Cidadania e Convivência em Paz',
    'Ciências',
    'Língua Portuguesa',
    'Maneiras de pensar e agir',
    'Matemática',
    'Princípios para uma vida saudável',
    'Tecnologia',
  ];

  static const List<String> anoPlanilhaList = <String>[
    '1º ano',
    '2º ano',
    '3º ano',
    '4º ano',
    '5º ano',
  ];

  static const List<String> habilidadeList = <String>[
    'EF01HI01',
    'EF02HI04',
    'EF01LP07',
    'EF02LP14',
    'EF02MA05',
    'EF03CI04',
    'EF01CI01',
    'EF02CI02SE',
    'EF01GE1',
    'EF02GE02',
    'EF15LP14',
    'EF01MA02',
    'EF02MA03',
    'EF01CI03',
    'EF02CI04',
    'EF01LP03',
    'EF01MA14',
    'EF02MA15',
    'EF01MA10',
    'EF02MA10',
    'EF15AR20',
    'EF01LP17',
    'EF02LP13',
    'EF01MA05',
    'EF02MA18',
    'EF01CI05',
    'EF02CI07',
    'EF15AR26',
    'EF15AR04SE',
    'EF01LP02',
    'EF02LP12',
    'EF01LP06',
    'EF02LP02',
    'EF01MA13',
    'EF02MA01SE',
    'EF02CI01',
    'EF05HI04',
    'EF02LP27',
    'EF01MA01SE',
    'EF02CI04SE',
    'EF01HI03',
    'EF02HI03',
    'EF01LP25',
    'EF01MA21',
    'EF02MA22',
    'EF01GE1SE',
    'EF02GE04',
    'EF01GE4',
    'EF02HI01',
    'EF01MA04',
    'EF01CI01SE',
    'EF02CI03SE',
    'EF02HI02',
    'EF03HI07',
    'EF03LP02',
    'EF03MA05',
    'EF03GE8',
    'EF03GE2',
    'EF03CI05',
    'EF03LP21',
    'EF03MA15',
    'EF03MA13',
    'EF01CI02',
    'EF05CI09',
    'EF03LP13',
    'EF03MA18',
    'EF03CI08',
    'EF15AR05',
    'EF03MA14',
    'EF03CI02',
    'EF03LP03',
    'EF03MA01SE',
    'EF03CI01SE',
    'EF03HI05',
    'EF03LP11',
    'EF03MA26',
    'EF03GE4',
    'EF03HI03',
    'EF03MA02SE',
    'EF03CI07',
    'EF15AR06',
    'EF04GE01',
    'EF04MA03',
    'EF05MA07',
    'EF04CI04',
    'EF05CI03SE',
    'EF15AR04',
    'EF04GE11',
    'EF05GE1',
    'EF04MA04',
    'EF05MA19',
    'EF05CI08',
    'EF04LP12',
    'EF05LP04',
    'EF04MA20',
    'EF04LP11',
    'EF05LP03',
    'EF04MA22',
    'EF05MA01',
    'EF04CI11',
    'EF05CI11',
    'EF04LP09',
    'EF04LP02',
    'EF05MA16',
    'EF04CI02',
    'EF05CI01',
    'EF04LP01',
    'EF05LP01',
    'EF04MA05',
    'EF05MA04SE',
    'EF04CI02SE',
    'EF04HI01',
    'EF05HI05',
    'EF04MA27',
    'EF05MA24',
    'EF05GE8',
    'EF04HI04',
    'EF04LP10',
    'EF05LP22',
    'EF04MA02',
    'EF04CI03',
    'EF05CI04',
    'EF01MA01',
    'EF01LP11',
    'EF15LP13',
    'EF01LP08',
    'EF01CI04',
    'EF01GE04',
    'EF01MA12',
    'EF15LP04',
    'EF15LP01',
    'EF02MA19',
    'EF02GE03',
    'EF02HI06',
    'EF01LP12',
    'EF04CI07',
    'EF04CI08',
    'EF35LP03',
    'EF03GE08',
    'EF03LP01',
    'EF03GE09',
    'EF02CI06',
    'EF02MA01',
    'EF15LP02',
    'EF03GE01',
    'EF03GE06',
    'EF03MA06',
    'EF03LP14',
    'EF03CI06',
    'EF03LP24',
    'EF03LP12',
    'EF03HI01',
    'EF03MA22',
    'EF03MA23',
    'EF03MA01',
    'EF03MA03',
    'EF03LP05',
    'EF35EF06',
    'EF03MA04',
    'EF04CI06',
    'EF35LP05',
    'EF04CI05',
    'EF15LP16',
    'EF15CI04',
    'EF05MA04',
    'EF06CI05',
    'EF05HI03',
    'EF06MA19',
    'EF35LP26',
    'EF05HI01',
    'EF05LP16',
    'EF04MA07',
    'EF05GE06',
    'EF04MA06',
    'EF05CI13',
    'EF04MA16',
  ];
}

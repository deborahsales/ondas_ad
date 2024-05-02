import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class PDFApi {
  static Future<File> loadNetwork(String url) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final cachedFilePath = join(dir.path, filename);

    if (await File(cachedFilePath).exists()) {
      return File(cachedFilePath);
    } else {
      final response = await http.get(Uri.parse(url));
      final bytes = response.bodyBytes;
      final file = File(cachedFilePath);
      await file.writeAsBytes(bytes, flush: true);
      return file;
    }
  }
}

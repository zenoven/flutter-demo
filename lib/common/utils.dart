import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> get appDataPath async {
  final folder = await getApplicationDocumentsDirectory();
  return folder.path;
}

Future<File> getFile(String fileName) async {
  final path = await appDataPath;
  return new File('$path/$fileName');
}

Future<File> wirteFile(String fileName, String content) async {
  final file = await getFile(fileName);
  return file.writeAsString(content);
}

FutureM<String> getContent(String fileName) async {
  final file = await getFile(fileName);
  return await file.readAsString();
}

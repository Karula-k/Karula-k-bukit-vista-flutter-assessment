import 'package:flutter/services.dart';

Future<String> readFilepath(String name) async {
  return await rootBundle.loadString('json/$name');
}

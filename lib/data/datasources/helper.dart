import 'dart:io';

String readFilepath(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/lib')) {
    dir = dir.replaceAll('/lib', '');
  }
  return '$dir/lib/common/json/$name';
}

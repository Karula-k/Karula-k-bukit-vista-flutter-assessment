import 'dart:convert';
import 'dart:io';
import 'package:bukit_vista_flutter_assessment/data/datasources/helper.dart';
import 'package:bukit_vista_flutter_assessment/data/models/guest_detail_model.dart';
import 'package:bukit_vista_flutter_assessment/data/models/guest_model.dart';

class JsonReaderHelper {
  Future<List<GuestModel>> getData() async {
    final path = readFilepath("guest_list.json");
    final file = await File(path).readAsString();
    final decode = jsonDecode(file) as List<dynamic>;
    return decode
        .map((e) => GuestModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<GuestDetailModel> getDetail(int id) async {
    final path = readFilepath("name_$id.json");
    final file = await File(path).readAsString();
    return GuestDetailModel.fromJson(jsonDecode(file));
  }
}

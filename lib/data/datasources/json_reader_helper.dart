import 'dart:convert';
import 'package:bukit_vista_flutter_assessment/data/datasources/helper.dart';
import 'package:bukit_vista_flutter_assessment/data/models/guest_detail_model.dart';
import 'package:bukit_vista_flutter_assessment/data/models/guest_model.dart';

class JsonReaderHelper {
  Future<List<GuestModel>> getData() async {
    final file = await readFilepath("guest_list.json");
    final decode = jsonDecode(file) as List<dynamic>;
    return decode
        .map((e) => GuestModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<GuestDetailModel> getDetail(int id) async {
    final file = await readFilepath("guest_0$id.json");
    return GuestDetailModel.fromJson(jsonDecode(file));
  }
}

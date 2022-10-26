import 'dart:io';

import 'package:bukit_vista_flutter_assessment/data/datasources/json_reader_helper.dart';
import 'package:bukit_vista_flutter_assessment/data/models/guest_detail_model.dart';
import 'package:bukit_vista_flutter_assessment/data/models/guest_model.dart';

abstract class LocalDataSources {
  Future<List<GuestModel>> gettingDataGuest();
  Future<GuestDetailModel> gettingGuestDetail(int id);
}

class LocalDataSourcesImpl implements LocalDataSources {
  final JsonReaderHelper helper;
  LocalDataSourcesImpl({required this.helper});
  @override
  Future<List<GuestModel>> gettingDataGuest() async {
    try {
      return await helper.getData();
    } catch (e) {
      throw FileSystemException(e.toString());
    }
  }

  @override
  Future<GuestDetailModel> gettingGuestDetail(int id) async {
    try {
      return await helper.getDetail(id);
    } catch (e) {
      throw FileSystemException(e.toString());
    }
  }
}

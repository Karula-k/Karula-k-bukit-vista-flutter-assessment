import 'package:bukit_vista_flutter_assessment/common/enum/status_enum.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guest.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guest_detail.dart';
import 'package:bukit_vista_flutter_assessment/domain/usecase/get_guest_data.dart';
import 'package:bukit_vista_flutter_assessment/domain/usecase/get_list_guest_data.dart';
import 'package:flutter/cupertino.dart';

class GetDataProvider extends ChangeNotifier {
  final GetGuestData getGuestData;
  final GetGuestListData getGuestListData;

  GetDataProvider({required this.getGuestData, required this.getGuestListData});

  StatusEnum _statusGuestList = StatusEnum.Empty;
  StatusEnum get statusGuestList => _statusGuestList;

  StatusEnum _statusGuestDetail = StatusEnum.Empty;
  StatusEnum get statusGuestDetail => _statusGuestDetail;

  var _listGuest = <Guest>[];
  List<Guest> get getListGuest => _listGuest;

  late GuestDetail _guestDetail;
  GuestDetail get guestDetail => _guestDetail;

  String _massage = '';
  String get massage => _massage;

  Future<void> fetchListGuest() async {
    _statusGuestList = StatusEnum.Loading;
    notifyListeners();
    final result = await getGuestListData.excute();
    result.fold((failure) {
      _statusGuestList = StatusEnum.Error;
      _massage = failure.message;
      notifyListeners();
    }, (guestListData) {
      _statusGuestList = StatusEnum.Loaded;
      _listGuest = guestListData;
      notifyListeners();
    });
  }

  Future<void> fetchGuestDetail(int id) async {
    _statusGuestList = StatusEnum.Loading;
    notifyListeners();
    final result = await getGuestData.excute(id);
    result.fold((failure) {
      _statusGuestDetail = StatusEnum.Error;
      _massage = failure.message;
      notifyListeners();
    }, (guestDetails) {
      _statusGuestDetail = StatusEnum.Loaded;
      _guestDetail = guestDetails;
      notifyListeners();
    });
  }
}

import 'package:bukit_vista_flutter_assessment/common/failure.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guest.dart';
import 'package:bukit_vista_flutter_assessment/domain/repositories/guest_repository.dart';
import 'package:dartz/dartz.dart';

class GetGuestListData {
  final GuestRepository repository;

  GetGuestListData(this.repository);

  Future<Either<Failure, List<Guest>>> excute() {
    return repository.getListGuestData();
  }
}

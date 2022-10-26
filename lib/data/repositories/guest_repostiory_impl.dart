import 'package:bukit_vista_flutter_assessment/domain/entities/guest.dart';
import 'package:bukit_vista_flutter_assessment/common/failure.dart';
import 'package:bukit_vista_flutter_assessment/domain/repositories/guest_repository.dart';
import 'package:dartz/dartz.dart';

class GuestRepositoryImpl implements GuestRepository {
  @override
  Future<Either<Failure, Guest>> getGuestData(String id) {
    // TODO: implement getGuestData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Guest>>> getListGuestData() {
    // TODO: implement getListGuestData
    throw UnimplementedError();
  }
}

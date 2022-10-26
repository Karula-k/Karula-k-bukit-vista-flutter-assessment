import 'package:bukit_vista_flutter_assessment/common/failure.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guest.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guest_detail.dart';
import 'package:dartz/dartz.dart';

abstract class GuestRepository {
  Future<Either<Failure, List<Guest>>> getListGuestData();
  Future<Either<Failure, GuestDetail>> getGuestData(int id);
}

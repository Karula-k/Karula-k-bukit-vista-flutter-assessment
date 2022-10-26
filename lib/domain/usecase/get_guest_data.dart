import 'package:bukit_vista_flutter_assessment/common/failure.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guest_detail.dart';
import 'package:bukit_vista_flutter_assessment/domain/repositories/guest_repository.dart';
import 'package:dartz/dartz.dart';

class GetGuestData {
  final GuestRepository repository;

  GetGuestData(this.repository);

  Future<Either<Failure, GuestDetail>> excute(int id) {
    return repository.getGuestData(id);
  }
}

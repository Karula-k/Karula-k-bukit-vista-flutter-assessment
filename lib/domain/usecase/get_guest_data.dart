import 'package:bukit_vista_flutter_assessment/common/failure.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guest.dart';
import 'package:bukit_vista_flutter_assessment/domain/repositories/guest_repository.dart';
import 'package:dartz/dartz.dart';

class GetGuestData {
  final GuestRepository repository;

  GetGuestData(this.repository);

  Future<Either<Failure, Guest>> excute(String id) {
    return repository.getGuestData(id);
  }
}

import 'dart:io';

import 'package:bukit_vista_flutter_assessment/data/datasources/local_data_source.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guest.dart';
import 'package:bukit_vista_flutter_assessment/common/failure.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guest_detail.dart';
import 'package:bukit_vista_flutter_assessment/domain/repositories/guest_repository.dart';
import 'package:dartz/dartz.dart';

class GuestRepositoryImpl implements GuestRepository {
  final LocalDataSourcesImpl localDataSourcesImpl;
  GuestRepositoryImpl({required this.localDataSourcesImpl});
  @override
  Future<Either<Failure, GuestDetail>> getGuestData(int id) async {
    try {
      return Right(await localDataSourcesImpl.gettingGuestDetail(id));
    } on FileSystemException {
      return const Left(
          FileFailure('Something wrong in the file we try to retrive'));
    }
  }

  @override
  Future<Either<Failure, List<Guest>>> getListGuestData() async {
    try {
      return Right(await localDataSourcesImpl.gettingDataGuest());
    } on FileSystemException {
      return const Left(
          FileFailure("Something wrong in the file we try to retrive"));
    }
  }
}

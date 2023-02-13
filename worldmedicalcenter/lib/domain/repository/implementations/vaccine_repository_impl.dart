import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../data/data sources/implementations/vaccine_data_source.dart';
import '../../models/vaccine.dart';
import '../interfaces/vaccine_repository.dart';

class VaccineRepositoryImpl implements VaccineRepository {
  VaccineDataSources vaccineDataSources;
  VaccineRepositoryImpl(this.vaccineDataSources);

  @override
  Future<Either<Failure, Unit>> createVaccine(
       Vaccine vaccine) async {
    try {
      final result = await vaccineDataSources.create(
           Vaccine(id: vaccine.id, name: vaccine.name, code: vaccine.code));
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure,Vaccine>> getVaccine(String name) async {
    try {
      final result = await vaccineDataSources.find(name);
      return Right(
          Vaccine(id: result.id, name: result.code, code: result.name));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteVaccine(String id) async {
    try {
      final result = await vaccineDataSources.delete(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

import '../../../core/error/failures.dart';
import '../../../data/data sources/implementations/allergies_data_source.dart';

class AllergyRepositoryImpl implements AllergyRepository {
  AllergiesDataSources allergyDataSources;
  AllergyRepositoryImpl(this.allergyDataSources);

  @override
  Future<Either<Failure, Unit>> createAllergy(
       Allergy allergy) async {
    try {
      final result = await allergyDataSources.create(
           Allergy(id: allergy.id, name: allergy.name, code: allergy.code));
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure,List<Allergy>>> getAllergy(String id) async {
    try {
      final result = await allergyDataSources.find(id);
      return Right(result.map((e) => Allergy(id: e.id, name: e.name, code: e.code)).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAllergy(String id) async {
    try {
      final result = await allergyDataSources.delete(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

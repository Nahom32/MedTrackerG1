import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

import '../../../core/error/failures.dart';
import '../../../data/data sources/implementations/allergies_data_source.dart';

class AllergyRepositoryImpl implements AllergyRepository {
  AllergiesDataSources allergyDataSources;
  AllergyRepositoryImpl(this.allergyDataSources);

  @override
  Future<Either<Failure, Unit>> addAllergy(
       int id) async {
    try {
      final result = await allergyDataSources.add(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure,List<Allergy>>> getAllergy() async {
    try {
      final result = await allergyDataSources.find();
      return Right(result.map((e) => Allergy(id: e.id, name: e.name, code: e.code)).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAllergy(List list) async {
    try {
      final result = await allergyDataSources.delete(list);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
  @override 
  Future<Either<Failure,List<Allergy>>> searchAllergy(String name) async {
    try {
      final result = await allergyDataSources.search(name);
      return Right(result.map((e) => Allergy(id: e.id, name: e.name, code: e.code)).toList());
    }catch(e) {
      return Left(ServerFailure());
    }
  }
}

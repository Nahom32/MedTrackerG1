import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/data/entities/user_allergies.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

import '../../../core/error/failures.dart';
import '../../../data/data sources/implementations/allergies_data_source.dart';
import '../../models/user.dart';

class AllergyRepositoryImpl implements AllergyRepository {
  AllergiesDataSources allergyDataSources;
  AllergyRepositoryImpl(this.allergyDataSources);

  @override
  Future<Either<Failure, Unit>> createAllergy(Allergy allergy) async {
    try {
      final result = await allergyDataSources.create(UserAllergies(
          allergyId: allergy.allergyId,
          user: allergy.user,
          title: allergy.title,
          description: allergy.description,
          date: allergy.date));
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserAllergies>>> getAllAllergies() async {
    try {
      final result = await allergyDataSources.find();
      return Right(result
          .map((e) => UserAllergies(
              allergyId: e.allergyId,
              user: e.user,
              title: e.title,
              description: e.description,
              date: e.date))
          .toList());
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

  @override
  Future<Either<Failure, Unit>> updateAllergy(String id,
      {User? user, String? date, String? description, String? title}) async {
    try {
      final result = await allergyDataSources.update(id,
          user: user, date: date, description: description, title: title);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/data/entities/user_allergies.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';

import '../../../core/error/failures.dart';
import '../../models/user.dart';

abstract class AllergyRepository {
  Future<Either<Failure, List<UserAllergies>>> getAllAllergies();
  Future<Either<Failure, Unit>> createAllergy(Allergy allergy);
  Future<Either<Failure, Unit>> deleteAllergy(String id);
  Future<Either<Failure, Unit>> updateAllergy(String id,
      {User? user, String? date, String? description, String? title});
}

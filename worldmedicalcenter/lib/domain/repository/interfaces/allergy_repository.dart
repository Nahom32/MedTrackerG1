import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';

import '../../../core/error/failures.dart';


abstract class AllergyRepository {
  Future<Either<Failure, Allergy>> getAllergy(String name);
  Future<Either<Failure, Unit>> createAllergy(Allergy allergy);
  Future<Either<Failure, Unit>> deleteAllergy(String id);
}

import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';

import '../../../core/error/failures.dart';


abstract class AllergyRepository {
  Future<Either<Failure, List<Allergy>>> getAllergy();
  Future<Either<Failure, Unit>> addAllergy(int id);
  Future<Either<Failure, Unit>> deleteAllergy(List list);
  Future<Either<Failure,List<Allergy>>> searchAllergy(String name);
}
 
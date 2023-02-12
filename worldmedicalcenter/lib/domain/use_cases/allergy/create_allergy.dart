import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

abstract class CreateAllergy {
  Future<Either<Failure, Unit>> execute(Allergy allergy);
}

class CreateAllergyImpl implements CreateAllergy {
  AllergyRepository allergyRepository;
  CreateAllergyImpl(this.allergyRepository);

  @override 

  Future<Either<Failure,Unit>> execute(Allergy allergy) async {
    final result = await allergyRepository.createAllergy(allergy);
    return result;
  }
}

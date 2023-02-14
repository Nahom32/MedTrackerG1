import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

abstract class CreateAllergy {
  Future<Either<Failure, Unit>> execute(int id);
}

class CreateAllergyImpl implements CreateAllergy {
  AllergyRepository allergyRepository;
  CreateAllergyImpl(this.allergyRepository);

  @override 

  Future<Either<Failure,Unit>> execute(int id) async {
    final result = await allergyRepository.addAllergy(id);
    return result;
  }
}

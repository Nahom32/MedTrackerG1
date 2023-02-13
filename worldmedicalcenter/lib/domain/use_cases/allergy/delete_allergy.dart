import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

abstract class DeleteAllergy {
  Future<Either<Failure, Unit>> execute(String id);
}

class DeleteAllergyImpl implements DeleteAllergy {
  AllergyRepository allergyRepository;
  DeleteAllergyImpl(this.allergyRepository);

  @override
  Future<Either<Failure, Unit>> execute(String id) async {
    final result = await allergyRepository.deleteAllergy(id);
    return result;
  }
}

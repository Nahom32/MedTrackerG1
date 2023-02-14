import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

abstract class DeleteAllergy {
  Future<Either<Failure, Unit>> execute(List list);
}

class DeleteAllergyImpl implements DeleteAllergy {
  AllergyRepository allergyRepository;
  DeleteAllergyImpl(this.allergyRepository);

  @override
  Future<Either<Failure, Unit>> execute(List list) async {
    final result = await allergyRepository.deleteAllergy(list);
    return result;
  }
}

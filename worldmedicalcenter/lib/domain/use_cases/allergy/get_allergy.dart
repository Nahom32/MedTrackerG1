import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

abstract class GetAllergy {
  Future<Either<Failure, List<Allergy>>> execute();
}

class GetAllergyImpl implements GetAllergy {
  AllergyRepository allergyRepository;
  GetAllergyImpl(this.allergyRepository);

  @override
  Future<Either<Failure, List<Allergy>>> execute() async {
    final result = allergyRepository.getAllergy();
    return result;
  }
}

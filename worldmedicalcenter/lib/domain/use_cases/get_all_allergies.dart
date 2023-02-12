import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/data/entities/user_allergies.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

abstract class GetAllAllergies {
  Future<Either<Failure, List<UserAllergies>>> execute();
}

class GetAllAllergiesImpl implements GetAllAllergies {
  AllergyRepository allergyRepository;
  GetAllAllergiesImpl(this.allergyRepository);

  @override
  Future<Either<Failure, List<UserAllergies>>> execute() async {
    final result = allergyRepository.getAllAllergies();
    return result;
  }
}

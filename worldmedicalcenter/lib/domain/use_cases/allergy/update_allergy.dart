import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

import '../../../core/error/failures.dart';
import '../../models/user.dart';

abstract class UpdateAllergy {
  Future<Either<Failure, Unit>> execute(String id,
      {User? user, String? date, String? description, String? title});
}

class UpdateAllergyImpl implements UpdateAllergy {
  AllergyRepository allergyRepository;
  UpdateAllergyImpl(this.allergyRepository);

  @override
  Future<Either<Failure, Unit>> execute(String id,
      {User? user, String? date, String? description, String? title}) async {
    final result = allergyRepository.updateAllergy(id,
        user: user, date: date, description: description, title: title);

    return result;
  }
}

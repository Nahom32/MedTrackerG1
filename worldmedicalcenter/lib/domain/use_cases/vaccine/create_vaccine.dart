import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/models/vaccine.dart';

import '../../repository/interfaces/vaccine_repository.dart';

abstract class CreateVaccine {
  Future<Either<Failure, Unit>> execute(Vaccine vaccine);
}

class CreateVaccineImpl implements CreateVaccine {
  VaccineRepository vaccineRepository;
  CreateVaccineImpl(this.vaccineRepository);

  @override 

  Future<Either<Failure,Unit>> execute(Vaccine vaccine ) async {
    final result = await vaccineRepository.createVaccine(vaccine);
    return result;
  }
}

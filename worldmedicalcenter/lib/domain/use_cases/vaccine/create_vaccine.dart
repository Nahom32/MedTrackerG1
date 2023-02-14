import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/models/vaccine.dart';

import '../../repository/interfaces/vaccine_repository.dart';

abstract class CreateVaccine {
  Future<Either<Failure, Unit>> execute(int id);
}

class CreateVaccineImpl implements CreateVaccine {
  VaccineRepository vaccineRepository;
  CreateVaccineImpl(this.vaccineRepository);

  @override 

  Future<Either<Failure,Unit>> execute(int id ) async {
    final result = await vaccineRepository.addVaccine(id);
    return result;
  }
}

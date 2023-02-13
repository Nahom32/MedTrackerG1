import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/models/vaccine.dart';

import '../../repository/interfaces/vaccine_repository.dart';

abstract class GetVaccine {
  Future<Either<Failure, Vaccine>> execute(String name);
}

class GetVaccineImpl implements GetVaccine {
  VaccineRepository vaccineRepository;
  GetVaccineImpl(this.vaccineRepository);

  @override
  Future<Either<Failure, Vaccine>> execute(String name) async {
    final result = vaccineRepository.getVaccine(name);
    return result;
  }
}

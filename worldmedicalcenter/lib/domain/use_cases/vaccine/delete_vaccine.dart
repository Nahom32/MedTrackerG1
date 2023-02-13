import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

import '../../repository/interfaces/vaccine_repository.dart';

abstract class DeleteVaccine {
  Future<Either<Failure, Unit>> execute(String id);
}

class DeleteVaccineImpl implements DeleteVaccine {
  VaccineRepository vaccineRepository;
  DeleteVaccineImpl(this.vaccineRepository);

  @override
  Future<Either<Failure, Unit>> execute(String id) async {
    final result = await vaccineRepository.deleteVaccine(id);
    return result;
  }
}

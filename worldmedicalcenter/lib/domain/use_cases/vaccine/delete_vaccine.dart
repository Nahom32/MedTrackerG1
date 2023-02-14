import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';

import '../../repository/interfaces/vaccine_repository.dart';

abstract class DeleteVaccine {
  Future<Either<Failure, Unit>> execute(List list);
}

class DeleteVaccineImpl implements DeleteVaccine {
  VaccineRepository vaccineRepository;
  DeleteVaccineImpl(this.vaccineRepository);

  @override
  Future<Either<Failure, Unit>> execute(List list) async {
    final result = await vaccineRepository.deleteVaccine(list);
    return result;
  }
}

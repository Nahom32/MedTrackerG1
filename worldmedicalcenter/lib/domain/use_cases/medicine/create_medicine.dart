import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/models/medcine.dart';

import '../../repository/interfaces/medicine_repository.dart';

abstract class CreateMedicine {
  Future<Either<Failure, Unit>> execute(Medicine allergy);
}

class CreateMedicineImpl implements CreateMedicine{
  MedicineRepository allergyRepository;
  CreateMedicineImpl(this.allergyRepository);

  @override 

  Future<Either<Failure,Unit>> execute(Medicine medicine) async {
    final result = await allergyRepository.createMedicine(medicine);
    return result;
  }
}

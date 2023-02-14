import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';

import '../../repository/interfaces/medicine_repository.dart';

abstract class DeleteMedicine {
  Future<Either<Failure, Unit>> execute(String id);
}

class DeleteMedicineImpl implements DeleteMedicine {
  MedicineRepository medicineRepository;
  DeleteMedicineImpl(this.medicineRepository);

  @override
  Future<Either<Failure, Unit>> execute(String id) async {
    final result = await medicineRepository.deleteMedicine(id);
    return result;
  }
}

import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import 'package:worldmedicalcenter/domain/models/medcine.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/medicine_repository.dart';

abstract class GetMedicine {
  Future<Either<Failure, Medicine>> execute(String name);
}

class GetMedicineImpl implements GetMedicine {
  MedicineRepository medicineRepository;
  GetMedicineImpl(this.medicineRepository);

  @override
  Future<Either<Failure, Medicine>> execute(String name) async {
    final result = medicineRepository.getMedicine(name);
    return result;
  }
}

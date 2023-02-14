import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/application/blocs/medicine/MedicineEvent.dart';

import '../../../core/error/failures.dart';
import '../../models/medcine.dart';


abstract class MedicineRepository {
  Future<Either<Failure, Medicine>> getMedicine(String name);
  Future<Either<Failure, Unit>> createMedicine(Medicine medicine);
  Future<Either<Failure, Unit>> deleteMedicine(String id);
}

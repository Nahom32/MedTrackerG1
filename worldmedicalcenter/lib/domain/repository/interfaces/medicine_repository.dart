import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/application/blocs/medicine/MedicineEvent.dart';

import '../../../core/error/failures.dart';
import '../../models/medcine.dart';


abstract class MedicineRepository {
  Future<Either<Failure, List<Medicine>>> getMedicine();
  Future<Either<Failure, Unit>> addMedicine(int id);
  Future<Either<Failure, Unit>> deleteMedicine(List list);
  Future<Either<Failure,List<Medicine>>> searchMedicine(String name);
}
 
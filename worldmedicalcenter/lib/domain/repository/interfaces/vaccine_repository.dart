import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/vaccine.dart';

import '../../../core/error/failures.dart';


abstract class VaccineRepository {
  Future<Either<Failure, Vaccine>> getVaccine(String name);
  Future<Either<Failure, Unit>> createVaccine(Vaccine vaccine);
  Future<Either<Failure, Unit>> deleteVaccine(String id);
}

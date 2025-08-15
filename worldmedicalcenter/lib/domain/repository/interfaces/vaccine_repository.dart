import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/vaccine.dart';

import '../../../core/error/failures.dart';
import '../../models/vaccine.dart';


abstract class VaccineRepository {
  Future<Either<Failure, List<Vaccine>>> getVaccine();
  Future<Either<Failure, Unit>> addVaccine(int id);
  Future<Either<Failure, Unit>> deleteVaccine(List list);
   Future<Either<Failure,List<Vaccine>>> searchVaccine(String name);
}


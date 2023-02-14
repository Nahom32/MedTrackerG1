import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../models/diagnoses.dart';
 

abstract class DiagnosesRepository {
  Future<Either<Failure,List<Diagnoses>>> getDiagnoses();
  Future<Either<Failure, Unit>> addDiagnoses(int id);
  Future<Either<Failure, Unit>> deleteDiagnoses(List list);
  Future<Either<Failure,List<Diagnoses>>> searchDiagnoses(String name);
}
 
 
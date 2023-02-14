import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../models/diagnoses.dart';
 

abstract class DiagnosesRepository {
  Future<Either<Failure,Diagnoses>> getDiagnoses(String name);
  Future<Either<Failure, Unit>> createDiagnoses(Diagnoses diagnoses);
  Future<Either<Failure, Unit>> deleteDiagnoses(String id);
}

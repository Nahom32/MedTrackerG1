import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/models/diagnoses.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/diagnoses_repository.dart';
 

abstract class CreateDiagnoses {
  Future<Either<Failure, Unit>> execute(Diagnoses diagnoses);
}

class CreateAllergyImpl implements CreateDiagnoses {
  DiagnosesRepository diagnosesRepository;
  CreateAllergyImpl(this.diagnosesRepository);

  @override 

  Future<Either<Failure,Unit>> execute(Diagnoses diagnoses) async {
    final result = await diagnosesRepository.createDiagnoses(diagnoses);
    return result;
  }
}

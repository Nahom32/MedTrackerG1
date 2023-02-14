import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/models/diagnoses.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/diagnoses_repository.dart';

abstract class GetDiagnoses {
  Future<Either<Failure, List<Diagnoses>>> execute();
}

class GetAllDiagnosesImpl implements GetDiagnoses {
  DiagnosesRepository diagnosesRepository;
  GetAllDiagnosesImpl(this.diagnosesRepository);

  @override
  Future<Either<Failure, List<Diagnoses>>> execute() async {
    final result = diagnosesRepository.getDiagnoses();
    return result;
  }
}

import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/diagnoses_repository.dart';


abstract class DeleteDiagnoses {
  Future<Either<Failure, Unit>> execute(String id);
}

class DeleteDiagnosesImpl implements DeleteDiagnoses {
  DiagnosesRepository diagnosesRepository;
  DeleteDiagnosesImpl(this.diagnosesRepository);

  @override
  Future<Either<Failure, Unit>> execute(String id) async {
    final result = await  diagnosesRepository.deleteDiagnoses(id);
    return result;
  }
}

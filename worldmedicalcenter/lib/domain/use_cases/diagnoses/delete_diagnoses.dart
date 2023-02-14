import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/core/error/failures.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/diagnoses_repository.dart';


abstract class DeleteDiagnoses {
  Future<Either<Failure, Unit>> execute(List list);
}

class DeleteDiagnosesImpl implements DeleteDiagnoses {
  DiagnosesRepository diagnosesRepository;
  DeleteDiagnosesImpl(this.diagnosesRepository);

  @override
  Future<Either<Failure, Unit>> execute(List list) async {
    final result = await  diagnosesRepository.deleteDiagnoses(list);
    return result;
  }
}

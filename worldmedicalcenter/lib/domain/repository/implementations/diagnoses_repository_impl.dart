import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/diagnoses.dart';
 

import '../../../core/error/failures.dart';
import '../../../data/data sources/implementations/diagnoses_data_source.dart';
import '../interfaces/diagnoses_repository.dart';
 

class DiagnosesRepositoryImpl implements DiagnosesRepository {
  DignosesDataSources  diagnosesDataSources;
  DiagnosesRepositoryImpl(this.diagnosesDataSources);

  @override
  Future<Either<Failure, Unit>> createDiagnoses(Diagnoses diagnoses) async {
    try {
      final result = await diagnosesDataSources.create(Diagnoses(
          id: diagnoses.id,
          name : diagnoses.name,
          code: diagnoses.code));
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Diagnoses>> getDiagnoses(String name) async {
    try {
      final result = await diagnosesDataSources.find(name);
      return Right(Diagnoses(id:result.id,name : result.name,code : result.code));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteDiagnoses(String id) async {
    try {
      final result = await diagnosesDataSources.delete(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }


}

import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/diagnoses.dart';
 

import '../../../core/error/failures.dart';
import '../../../data/data sources/implementations/diagnoses_data_source.dart';
import '../interfaces/diagnoses_repository.dart';
 

class DiagnosesRepositoryImpl implements DiagnosesRepository {
  DignosesDataSources  diagnosesDataSources;
  DiagnosesRepositoryImpl(this.diagnosesDataSources);

  @override
  Future<Either<Failure, Unit>> addDiagnoses(int id) async {
    try {
      final result = await diagnosesDataSources.add(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Diagnoses>>> getDiagnoses() async {
    try {
      final result = await diagnosesDataSources.find();
      return Right(result.map((e) => Diagnoses(id: e.id, name: e.name, code: e.code)).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteDiagnoses(List list) async {
    try {
      final result = await diagnosesDataSources.delete(list);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
  
    @override 
  Future<Either<Failure,List<Diagnoses>>> searchDiagnoses(String name) async {
    try {
      final result = await diagnosesDataSources.search(name);
      return Right(result.map((e) => Diagnoses(id: e.id, name: e.name, code: e.code)).toList());
    }catch(e) {
      return Left(ServerFailure());
    }
  }

}

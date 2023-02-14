import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/medcine.dart';

import '../../../core/error/failures.dart';
import '../../../data/data sources/implementations/vaccine_data_source.dart';
import '../../models/vaccine.dart';
import '../interfaces/vaccine_repository.dart';

class VaccineRepositoryImpl implements VaccineRepository {
  VaccineDataSources vaccineDataSources;
  VaccineRepositoryImpl(this.vaccineDataSources);

  @override
  Future<Either<Failure, Unit>> addVaccine(int id) async {
    try {
      final result = await vaccineDataSources.add(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure,List<Vaccine>>> getVaccine() async {
    try {
      final result = await vaccineDataSources.find();
      return Right(result.map((e) => Vaccine(id: e.id, name: e.name, code: e.code)).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteVaccine(List list) async {
    try {
      final result = await vaccineDataSources.delete(list);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

   @override 
  Future<Either<Failure,List<Vaccine>>> searchVaccine(String name) async {
    try {
      final result = await  vaccineDataSources.search(name);
      return Right(result.map((e) => Vaccine(id: e.id, name: e.name, code: e.code)).toList());
    }catch(e) {
      return Left(ServerFailure());
    }
  }
}

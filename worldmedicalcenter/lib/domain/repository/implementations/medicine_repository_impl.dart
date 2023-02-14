import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/medicine_repository.dart';

import '../../../core/error/failures.dart';
import '../../../data/data sources/implementations/medicine_data_source.dart';
import '../../models/medcine.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  MedicineDataSources medicineDataSources;
  MedicineRepositoryImpl(this.medicineDataSources);

  @override
  Future<Either<Failure, Unit>> addMedicine(int id) async {
    try {
      final result = await medicineDataSources.add(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Medicine>>> getMedicine( ) async {
    try {
      final result = await medicineDataSources.find();
      return Right(result.map((e) => Medicine(id: e.id, name: e.name, code: e.code)).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMedicine(List list) async {
    try {
      final result = await medicineDataSources.delete(list);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override 
  Future<Either<Failure,List<Medicine>>> searchMedicine(String name) async {
    try {
      final result = await medicineDataSources.search(name);
      return Right(result.map((e) => Medicine(id: e.id, name: e.name, code: e.code)).toList());
    }catch(e) {
      return Left(ServerFailure());
    }
  }
}

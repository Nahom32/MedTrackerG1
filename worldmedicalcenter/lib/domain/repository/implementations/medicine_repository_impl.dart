import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/medicine_repository.dart';

import '../../../core/error/failures.dart';
import '../../../data/data sources/implementations/medicine_data_source.dart';
import '../../models/medcine.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  MedicineDataSources medicineDataSources;
  MedicineRepositoryImpl(this.medicineDataSources);

  @override
  Future<Either<Failure, Unit>> createMedicine(Medicine medicine) async {
    try {
      final result = await medicineDataSources.create(
          Medicine(id: medicine.id, name: medicine.name, code: medicine.code));
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Medicine>> getMedicine(String name) async {
    try {
      final result = await medicineDataSources.find(name);
      return Right(
          Medicine(id: result.id, name: result.code, code: result.name));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMedicine(String id) async {
    try {
      final result = await medicineDataSources.delete(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

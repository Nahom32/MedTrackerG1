import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/medcine.dart';

abstract class MedicineData {
  Future<Medicine> find(
     String name,
   );
  Future<Unit> create(Medicine data);
  Future<Unit> delete(String id);
}

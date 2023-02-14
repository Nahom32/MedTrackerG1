import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/medcine.dart';

abstract class MedicineData {
  Future<List<Medicine>> find();
  Future<Unit> add(int id);
  Future<Unit> delete(List list);
  Future<List<Medicine>> search(String name);
}

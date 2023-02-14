import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';

abstract class AllergiesData {
  Future<List<Allergy>> find();
  Future<Unit> add(int id);
  Future<Unit> delete(List list);
  Future<List<Allergy>> search(String name);
}

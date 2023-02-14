import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/vaccine.dart';

abstract class VaccineData {
  Future<List<Vaccine>> find();
  Future<Unit> add(int id);
  Future<Unit> delete(List list);
  Future<List<Vaccine>> search(String name);
}
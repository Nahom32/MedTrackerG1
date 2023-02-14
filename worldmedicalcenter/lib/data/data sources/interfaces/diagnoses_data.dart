import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/diagnoses.dart';

abstract class DiagnosesData {
  Future<List<Diagnoses>> find();
  Future<Unit> add(int id);
  Future<Unit> delete(List list);
  Future<List<Diagnoses>> search(String name);
}
 
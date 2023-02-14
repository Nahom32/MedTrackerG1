import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/diagnoses.dart';

abstract class DiagnosesData {
  Future<Diagnoses> find(
   String name);
  Future<Unit> create(Diagnoses data);
  Future<Unit> delete(String id);
}

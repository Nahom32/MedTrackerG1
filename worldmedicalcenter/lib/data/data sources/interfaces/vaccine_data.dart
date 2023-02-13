import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/vaccine.dart';

abstract class VaccineData {
  Future<Vaccine> find(
     String name,
   );
  Future<Unit> create(Vaccine data);
  Future<Unit> delete(String id);
}

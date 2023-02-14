import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';

abstract class AllergiesData {
  Future<List<Allergy>> find(
     String id
   );
  Future<Unit> create(Allergy data);
  Future<Unit> delete(String id);
}

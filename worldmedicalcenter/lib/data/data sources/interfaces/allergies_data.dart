import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/data/entities/user_allergies.dart';
 

import '../../../domain/models/user.dart';

abstract class AllergiesData {
  Future<List<UserAllergies>> find({
    String title,
    User user,
    String allergyId,
    String description,
    String date,
  });
  Future<Unit> create(UserAllergies data);
  Future<Unit> delete(String id);
  Future<Unit> update(
    String id, {
    User? user,
    String? date,
    String? description,
    String? title,
  });
}

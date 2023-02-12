// ignore_for_file: constant_identifier_names

import 'package:worldmedicalcenter/data/entities/user_allergies.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/models/user.dart';
import '../interfaces/allergies_data.dart';

const String API_BASE = "http:/localhost:4000";

class AllergiesDataSources implements AllergiesData {
  @override
  Future<Unit> create(UserAllergies data) async {
    await Dio().post("$API_BASE/users/$data.user.userId/allergies", data: {
      "user": data.user,
      "description": data.description,
      "date": data.date,
      "title": data.title,
    });
    return unit;
  }

  @override
  Future<List<UserAllergies>> find({
    User? user,
    String? allergyId,
    String? title,
    String? description,
    String? date,
  }) async {
    var response = await Dio().get("$API_BASE/users/$user.Id/allergies");
    List<UserAllergies> list = [];
    response.data.forEach((d) {
      list.add(UserAllergies(
          allergyId: d['allergyId'],
          title: d['title'],
          description: d[title],
          date: d['date'],
          user: d['user']));
    });
    return list;
  }

  @override
  Future<Unit> delete( String id) async {
    await Dio().delete("$API_BASE/user/userId/allergies");
    return unit;
  }

  @override
  Future<Unit> update(
    String id, {
    User? user,
    String? date,
    String? description,
    String? title,
  }) async {
    dynamic dataToUpdate = {};
    if (date != null) {
      dataToUpdate['date'] = user;
    }
    if (description != null) {
      dataToUpdate['description'] = description;
    }
    if (title != null) {
      dataToUpdate['title'] = title;
    }
    await Dio().put('$API_BASE/users/userId/allergies/$id',data: dataToUpdate);

    return unit;
  }
}

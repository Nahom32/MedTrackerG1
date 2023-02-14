// ignore_for_file: constant_identifier_names
import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import '../interfaces/allergies_data.dart';

const String API_BASE =
    "https://b138-2a0d-5600-42-3000-00-27e8.ngrok.io/swagger/index.html";

class AllergiesDataSources implements AllergiesData {
  @override
  Future<Unit> create(Allergy data) async {
    await Dio().post("$API_BASE/user/allergies", data: {
      "id": data.id,
      "name": data.name,
      "code": data.code,
    });
    return unit;
  }

  @override
  Future<List<Allergy>> find(
    String id,
  ) async {
    var response = await Dio().get("$API_BASE/allergies/search/$id");
    List<Allergy> list = [];
    response.data.forEach((d) {
      Allergy(id: d['id'], name: d['name'], code: d['code']);
    });
    return list;
  }

  @override
  Future<Unit> delete(String id) async {
    await Dio().delete("$API_BASE/user/allergies/$id");
    return unit;
  }
}

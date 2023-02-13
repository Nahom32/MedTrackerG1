// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/medcine.dart';

import '../interfaces/medicine_data.dart';


const String API_BASE =
    "https://b138-2a0d-5600-42-3000-00-27e8.ngrok.io/swagger/index.html";

class MedicineDataSources implements MedicineData {
  @override
  Future<Unit> create(Medicine data) async {
    await Dio().post("$API_BASE/user/medicines", data: {
      "id": data.id,
      "name": data.name,
      "code": data.code,
    });
    return unit;
  }

  @override
  Future<Medicine> find(
    String? name,
  ) async {
    var response = await Dio().get("$API_BASE/medicines/search/$name");
    Medicine medicine = Medicine(
        id: response.data['id'],
        name: response.data['name'],
        code: response.data['code']);
    return medicine;
  }

  @override
  Future<Unit> delete(String id) async {
    await Dio().delete("$API_BASE/user/medicines/$id");
    return unit;
  }
}

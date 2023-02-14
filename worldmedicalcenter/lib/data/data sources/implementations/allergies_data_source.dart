// ignore_for_file: constant_identifier_names
import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import '../interfaces/allergies_data.dart';

const String API_BASE ="http://localhost:5260";

class AllergiesDataSources implements AllergiesData {
  @override
  Future<Unit> add(int id) async {
    await Dio().get("$API_BASE/api/allergy");
    return unit;
  }

  @override
  Future<List<Allergy>> find(
  ) async {
    var response = await Dio().get("$API_BASE/api/allergy");
    List<Allergy> list = [];
    response.data.forEach((d) {
      Allergy(id: d['id'], name: d['name'], code: d['code']);
    });
    return list;
  }

  @override
  Future<Unit> delete(List list) async {
    await Dio().post("$API_BASE/api/allergy", data : list);
    return unit;
  }

  @override 
  Future<List<Allergy>> search(String name) async {
    var response = await Dio().get("$API_BASE/api/search/allergy/$name");
    List<Allergy> list= [];
    response.data.forEach((d) => {
      list.add(Allergy(id: d['id'],name : d['name'],code:d["code"]))
    });
    return list;
  }
}

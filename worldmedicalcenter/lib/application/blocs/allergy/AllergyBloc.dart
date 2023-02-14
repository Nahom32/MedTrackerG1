import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldmedicalcenter/data/data%20sources/implementations/allergies_data_source.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import 'package:worldmedicalcenter/domain/repository/interfaces/allergy_repository.dart';
import 'package:worldmedicalcenter/domain/use_cases/allergy/get_allergy.dart';

import '../../../domain/models/NormalModel.dart';
import 'AllergyEvent.dart';
import 'AllergyState.dart';

class AllergyBloc extends Bloc<AllergyEvent, AllergyState> {
  final AllergiesDataSources allergyRepo = AllergiesDataSources();
  AllergyBloc() : super(Idle()) {
    on<LoadAllergy>(_loadAllergies);
    on<DeleteAllergy>(_deleteAllergies);
    on<SearchAllergy>(_searchAllergy);
  }

  List<NormalModel> testData = [
    NormalModel(userId: "1", id: "WMXC001", name: "allergy1"),
    NormalModel(userId: "2", id: "WMXC003", name: "allergy2"),
    NormalModel(userId: "3", id: "WMXC004", name: "allergy3"),
    NormalModel(userId: "1", id: "WMXC010", name: "allergy4"),
    NormalModel(userId: "1", id: "WMXC098", name: "allergy5"),
    NormalModel(userId: "1", id: "WACY001", name: "allergy6"),
  ];

  Future<FutureOr<void>> _loadAllergies(
      LoadAllergy event, Emitter<AllergyState> emit) async {
    emit(LoadingAllergy());
    final idToken = FirebaseAuth.instance.currentUser?.getIdTokenResult();

    //fetch here
    // emit(LoadingAllergy());
    // final response = await allergyRepo.find(event.id);
    // List<NormalModel> modified = [];
    // for (Allergy allergy in response){
    //   modified.add(NormalModel(userId: allergy.id, id: allergy.code, name: allergy.name));
    // }
    // emit(LoadedAllergy(allergies: modified));
    //end
    emit(LoadedAllergy(allergies: testData));
  }

  FutureOr<void> _deleteAllergies(
      DeleteAllergy event, Emitter<AllergyState> emit) async {
    emit(LoadingAllergy());
    for (NormalModel item in event.allergies) {
      // await allergyRepo.delete(item.id!);
      testData.remove(item);
    }
    emit(LoadedAllergy(allergies: testData));
  }

  FutureOr<void> _searchAllergy(
      SearchAllergy event, Emitter<AllergyState> emit) async {
    emit(LoadingAllergy());
    // final response = await allergyRepo.find(event.name);
    // List<NormalModel> modified = [];
    // for (Allergy allergy in response){
    //   modified.add(NormalModel(userId: allergy.id, id: allergy.code, name: allergy.name));
    // }
    // emit(LoadedAllergy(allergies: modified));
  }
}

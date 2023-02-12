import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/NormalModel.dart';
import 'AllergyEvent.dart';
import 'AllergyState.dart';

class AllergyBloc extends Bloc<AllergyEvent, AllergyState> {
  AllergyBloc() : super(Idle()) {
    on<LoadAllergy>(_loadAllergies);
    on<DeleteAllergy>(_deleteAllergies);
  }

  List<NormalModel> testData = [
    NormalModel(userId: 1, id: "WMXC001", name: "allergy1"),
    NormalModel(userId: 2, id: "WMXC003", name: "allergy2"),
    NormalModel(userId: 3, id: "WMXC004", name: "allergy3"),
    NormalModel(userId: 1, id: "WMXC010", name: "allergy4"),
    NormalModel(userId: 1, id: "WMXC098", name: "allergy5"),
    NormalModel(userId: 1, id: "WACY001", name: "allergy6"),
  ];

  FutureOr<void> _loadAllergies(LoadAllergy event, Emitter<AllergyState> emit) {
    emit(LoadingAllergy());
    Future.delayed(Duration(seconds: 5));
    emit(LoadedAllergy(allergies: testData));
  }

  FutureOr<void> _deleteAllergies(
      DeleteAllergy event, Emitter<AllergyState> emit) {
    emit(LoadingAllergy());
    for (NormalModel item in event.allergies) {
      testData.remove(item);
    }
    emit(LoadedAllergy(allergies: testData));
  }
}

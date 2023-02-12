import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldmedicalcenter/blocs/allergy/AllergyEvent.dart';
import 'package:worldmedicalcenter/blocs/allergy/AllergyState.dart';
import 'package:worldmedicalcenter/models/AllergyModel.dart';

class AllergyBloc extends Bloc<AllergyEvent, AllergyState> {
  AllergyBloc() : super(Idle()) {
    on<LoadAllergy>(_loadAllergies);
    on<DeleteAllergy>(_deleteAllergies);
  }

  List<AllergyModel> testData = [
    AllergyModel(userId: 1, allergyId: 4, allergyName: "allergy1"),
    AllergyModel(userId: 2, allergyId: 5, allergyName: "allergy2"),
    AllergyModel(userId: 3, allergyId: 6, allergyName: "allergy3"),
    AllergyModel(userId: 1, allergyId: 3, allergyName: "allergy4"),
    AllergyModel(userId: 1, allergyId: 2, allergyName: "allergy5"),
    AllergyModel(userId: 1, allergyId: 1, allergyName: "allergy6"),
  ];

  FutureOr<void> _loadAllergies(LoadAllergy event, Emitter<AllergyState> emit) {
    emit(LoadingAllergy());
    Future.delayed(Duration(seconds: 5));
    List<AllergyModel> allergy = [];
    for (AllergyModel test in testData) {
      if (test.userId == event.id) {
        allergy.add(test);
      }
    }
    emit(LoadedAllergy(allergies: allergy));
  }

  FutureOr<void> _deleteAllergies(
      DeleteAllergy event, Emitter<AllergyState> emit) {
    emit(LoadingAllergy());
    for (AllergyModel item in event.allergies) {
      testData.remove(item);
    }
    emit(LoadedAllergy(allergies: testData));
  }
}

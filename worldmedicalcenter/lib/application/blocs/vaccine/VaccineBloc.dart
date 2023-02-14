import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/NormalModel.dart';
import 'VaccineEvent.dart';
import 'VaccineState.dart';

class VaccineBloc extends Bloc<VaccineEvent, VaccineState> {
  VaccineBloc() : super(Idle()) {
    on<LoadVaccine>(_loadVaccines);
    on<DeleteVaccine>(_deleteVaccines);
    on<SearchEvent>(_searchVaccines);
  }

  List<NormalModel> testData = [
    NormalModel(userId: "1", id: "WMXC0040", name: "Vaccine15"),
    NormalModel(userId: "2", id: "WMXC0050", name: "Vaccine26"),
    NormalModel(userId: "3", id: "WMXC0060", name: "Vaccine34"),
    NormalModel(userId: "1", id: "WMXC0030", name: "Vaccine48"),
    NormalModel(userId: "1", id: "WMXC0020", name: "Vaccine56"),
  ];

  _loadVaccines(LoadVaccine event, Emitter<VaccineState> emit) {
    emit(LoadingVaccine());
    //fetch here
    // emit(LoadingAllergy());
    // final response = await allergyRepo.find(event.id);
    // List<NormalModel> modified = [];
    // for (Allergy allergy in response){
    //   modified.add(NormalModel(userId: allergy.id, id: allergy.code, name: allergy.name));
    // }
    // emit(LoadedAllergy(allergies: modified));
    //end
    emit(LoadedVaccine(vaccines: testData));
  }

  _deleteVaccines(DeleteVaccine event, Emitter<VaccineState> emit) {
    emit(LoadingVaccine());
    for (NormalModel item in event.vaccines) {
      // await allergyRepo.delete(item.id!);
      testData.remove(item);
    }
    emit(LoadedVaccine(vaccines: testData));
  }

  FutureOr<void> _searchVaccines(
      SearchEvent event, Emitter<VaccineState> emit) {
    emit(LoadingVaccine());
    // final response = await allergyRepo.find(event.name);
    // List<NormalModel> modified = [];
    // for (Allergy allergy in response){
    //   modified.add(NormalModel(userId: allergy.id, id: allergy.code, name: allergy.name));
    // }
    // emit(LoadedAllergy(allergies: modified));
  }
}

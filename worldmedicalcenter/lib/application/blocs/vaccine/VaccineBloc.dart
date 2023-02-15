import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldmedicalcenter/data/data%20sources/implementations/vaccine_data_source.dart';
import '../../../domain/models/NormalModel.dart';
import 'VaccineEvent.dart';
import 'VaccineState.dart';

class VaccineBloc extends Bloc<VaccineEvent, VaccineState> {
  final VaccineDataSources vaccineRepo = VaccineDataSources();
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
    // emit(LoadingVaccine());
    // final response = await vaccineRepo.find(event.id);
    // List<NormalModel> modified = [];
    // for (Vaccine vaccine in response){
    //   modified.add(NormalModel(userId: vaccine.id, id: vaccine.code, name: vaccine.name));
    // }
    // emit(LoadedVaccine(allergies: modified));
    //end
    emit(LoadedVaccine(vaccines: testData));
  }

  _deleteVaccines(DeleteVaccine event, Emitter<VaccineState> emit) {
    emit(LoadingVaccine());
    for (NormalModel item in event.vaccines) {
      // await vaccineRepo.delete(item.id!);
      testData.remove(item);
    }
    emit(LoadedVaccine(vaccines: testData));
  }

  FutureOr<void> _searchVaccines(
      SearchEvent event, Emitter<VaccineState> emit) {
    emit(LoadingVaccine());
    // final response = await vaccineRepo.find(event.name);
    // List<NormalModel> modified = [];
    // for (Vaccine vaccine in response){
    //   modified.add(NormalModel(userId: vaccine.id, id: vaccine.code, name: vaccine.name));
    // }
    // emit(LoadedVaccine(allergies: modified));
  }
}

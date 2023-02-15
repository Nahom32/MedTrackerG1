import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldmedicalcenter/data/data%20sources/implementations/medicine_data_source.dart';

import '../../../domain/models/NormalModel.dart';
import 'MedicineEvent.dart';
import 'MedicineState.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final MedicineDataSources medicineRepo = MedicineDataSources();
  MedicineBloc() : super(Idle()) {
    on<LoadMedicine>(_loadMedicines);
    on<DeleteMedicine>(_deleteMedicines);
    on<SearchMedicine>(_searchMedicine);
  }

  List<NormalModel> testData = [
    NormalModel(userId: "1", id: "MWXC0040", name: "Medicine10"),
    NormalModel(userId: "2", id: "MWXC0050", name: "Medicine20"),
    NormalModel(userId: "3", id: "MWXC0060", name: "Medicine30"),
    NormalModel(userId: "1", id: "MWXC0030", name: "Medicine40"),
    NormalModel(userId: "1", id: "MWXC0020", name: "Medicine50"),
    NormalModel(userId: "1", id: "MWXC0010", name: "Medicine60"),
    NormalModel(userId: "1", id: "MWXC0030", name: "Medicine40"),
    NormalModel(userId: "1", id: "MWXC0020", name: "Medicine50"),
    NormalModel(userId: "1", id: "MWXC0010", name: "Medicine60"),
  ];

  _loadMedicines(LoadMedicine event, Emitter<MedicineState> emit) {
    emit(LoadingMedicine());
    //fetch here
    // emit(LoadingMedicine());
    // final response = await medicineRepo.find(event.id);
    // List<NormalModel> modified = [];
    // for (Medicine medicine in response){
    //   modified.add(NormalModel(userId: medicine.id, id: medicine.code, name: medicine.name));
    // }
    // emit(LoadedMedicine(allergies: modified));
    //end
    emit(LoadedMedicine(medicines: testData));
  }

  _deleteMedicines(DeleteMedicine event, Emitter<MedicineState> emit) {
    emit(LoadingMedicine());
    for (NormalModel item in event.medicines) {
      // await medicineRepo.delete(item.id!);
      testData.remove(item);
    }
    emit(LoadedMedicine(medicines: testData));
  }

  FutureOr<void> _searchMedicine(
      SearchMedicine event, Emitter<MedicineState> emit) {
    emit(LoadingMedicine());
    // final response = await medicineRepo.find(event.name);
    // List<NormalModel> modified = [];
    // for (Medicine medicine in response){
    //   modified.add(NormalModel(userId: medicine.id, id: medicine.code, name: medicine.name));
    // }
    // emit(LoadedMedicine(allergies: modified));
  }
}

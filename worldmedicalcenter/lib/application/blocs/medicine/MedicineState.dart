import '../../../domain/models/NormalModel.dart';

abstract class MedicineState {}

class Idle extends MedicineState {}

class LoadingMedicine extends MedicineState {}

class LoadedMedicine extends MedicineState {
  final List<NormalModel> medicines;
  LoadedMedicine({
    required this.medicines,
  });
}

class FailedMedicine extends MedicineState {}

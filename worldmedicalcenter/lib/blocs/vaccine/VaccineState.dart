import '../../models/NormalModel.dart';

abstract class VaccineState {}

class Idle extends VaccineState {}

class LoadingVaccine extends VaccineState {}

class LoadedVaccine extends VaccineState {
  final List<NormalModel> vaccines;
  LoadedVaccine({
    required this.vaccines,
  });
}

class FailedVaccine extends VaccineState {}

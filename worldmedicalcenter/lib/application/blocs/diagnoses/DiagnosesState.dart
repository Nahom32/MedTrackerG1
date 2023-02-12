import '../../../domain/models/NormalModel.dart';

abstract class DiagnosesState {}

class Idle extends DiagnosesState {}

class LoadingDiagnoses extends DiagnosesState {}

class LoadedDiagnoses extends DiagnosesState {
  final List<NormalModel> diagnoses;
  LoadedDiagnoses({
    required this.diagnoses,
  });
}

class FailedDiagnoses extends DiagnosesState {}



import '../../../domain/models/NormalModel.dart';

abstract class AllergyState {}

class Idle extends AllergyState {}

class LoadingAllergy extends AllergyState {}

class LoadedAllergy extends AllergyState {
  late List<NormalModel> allergies;
  LoadedAllergy({
    required this.allergies,
  });
}

class FailedAllergy extends AllergyState {}

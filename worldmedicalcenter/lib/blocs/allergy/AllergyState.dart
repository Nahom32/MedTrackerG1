import 'package:worldmedicalcenter/models/AllergyModel.dart';

abstract class AllergyState {}

class Idle extends AllergyState {}

class LoadingAllergy extends AllergyState {}

class LoadedAllergy extends AllergyState {
  late List<AllergyModel> allergies;
  LoadedAllergy({
    required this.allergies,
  });
}

class FailedAllergy extends AllergyState {}

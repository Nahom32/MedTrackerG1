import '../../../domain/models/NormalModel.dart';

abstract class AllergyEvent {}

class AddAllergy extends AllergyEvent {
  final NormalModel newAllergy;

  AddAllergy(this.newAllergy);
}

class LoadAllergy extends AllergyEvent {
  final String id;

  LoadAllergy(this.id);
}

class DeleteAllergy extends AllergyEvent {
  final List<NormalModel> allergies;

  DeleteAllergy(this.allergies);
}

class SearchAllergy extends AllergyEvent {
  final String name;

  SearchAllergy(this.name);
}

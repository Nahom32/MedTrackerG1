import '../../../domain/models/PersonalInfo.dart';

abstract class PersonalInfoState {}

class Idle extends PersonalInfoState {}

class Saving extends PersonalInfoState {}

class Saved extends PersonalInfoState {
  PersonalInfo updatedInfo;
  Saved({required this.updatedInfo});
}

class SavingFailed extends PersonalInfoState{}
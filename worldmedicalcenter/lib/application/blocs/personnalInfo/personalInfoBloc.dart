import 'package:flutter_bloc/flutter_bloc.dart';
import './personalInfoEvent.dart';
import './personalInfoState.dart';

import '../../../domain/models/PersonalInfo.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(Idle()) {
    on<SaveEvent>(_personalInfoEventHandler);
  }
}

void _personalInfoEventHandler(SaveEvent event, Emitter emit) async {
  emit(Saving());

  try {
    PersonalInfo newInfo = event.newInfo;
    emit(Saved(updatedInfo: newInfo));
  } catch (Exceptions) {
    emit(SavingFailed());
  }
}

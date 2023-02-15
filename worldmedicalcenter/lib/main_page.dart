import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldmedicalcenter/presentation/ui/HomePage.dart';
import 'package:worldmedicalcenter/presentation/ui/splash.dart';

import 'application/blocs/allergy/AllergyBloc.dart';
import 'application/blocs/allergy/AllergyEvent.dart';
import 'application/blocs/diagnoses/DiagnosesBloc.dart';
import 'application/blocs/diagnoses/DiagnosesEvent.dart';
import 'application/blocs/medicine/MedicineBloc.dart';
import 'application/blocs/medicine/MedicineEvent.dart';
import 'application/blocs/vaccine/VaccineBloc.dart';
import 'application/blocs/vaccine/VaccineEvent.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final allergyBloc = BlocProvider.of<AllergyBloc>(context);
              allergyBloc.add(LoadAllergy("1"));
              final medicineBloc = BlocProvider.of<MedicineBloc>(context);
              medicineBloc.add(LoadMedicine("1"));
              final diagnosesBloc = BlocProvider.of<DiagnosesBloc>(context);
              diagnosesBloc.add(LoadDiagnoses("1"));
              final vaccineBloc = BlocProvider.of<VaccineBloc>(context);
              vaccineBloc.add(LoadVaccine("1"));
              
              return const HomePage();
            } else {
              return const Splash();
            }
          }),
    );
  }
}

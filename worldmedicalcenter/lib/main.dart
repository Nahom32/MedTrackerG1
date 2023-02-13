import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldmedicalcenter/application/blocs/medicine/MedicineBloc.dart';
import 'package:worldmedicalcenter/application/blocs/vaccine/VaccineBloc.dart';
import 'package:worldmedicalcenter/presentation/ui/Add.dart';
import 'package:worldmedicalcenter/presentation/ui/splash.dart';
import 'application/blocs/allergy/AllergyBloc.dart';
import 'application/blocs/diagnoses/DiagnosesBloc.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: ((context) => AllergyBloc())),
      BlocProvider(create: ((context) => MedicineBloc())),
      BlocProvider(create: ((context) => DiagnosesBloc())),
      BlocProvider(create: ((context) => VaccineBloc())),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/add": (context) => const Add()},
      title: 'World Medical App',
      theme: ThemeData(
        primaryTextTheme: const TextTheme(
            bodyText1: TextStyle(fontFamily: "Nunito Sans", fontSize: 10)),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            // borderSide: BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

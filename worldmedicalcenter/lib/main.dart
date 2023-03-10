import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldmedicalcenter/application/blocs/medicine/MedicineBloc.dart';
import 'package:worldmedicalcenter/application/blocs/vaccine/VaccineBloc.dart';
import 'package:worldmedicalcenter/main_page.dart';
import 'package:worldmedicalcenter/presentation/ui/Add.dart';
import 'application/blocs/allergy/AllergyBloc.dart';
import 'application/blocs/diagnoses/DiagnosesBloc.dart';
import 'application/blocs/personnalInfo/personalInfoBloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: ((context) => AllergyBloc())),
      BlocProvider(create: ((context) => MedicineBloc())),
      BlocProvider(create: ((context) => DiagnosesBloc())),
      BlocProvider(create: ((context) => VaccineBloc())),
      BlocProvider(create: ((context) => PersonalInfoBloc()))
    ], child: const MyApp()),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: {"/add": (context) => Add()},
      title: 'World Medical App',
      theme: ThemeData(
        primaryTextTheme: const TextTheme(
            bodyText1: TextStyle(fontFamily: "Nunito Sans", fontSize: 10)),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:worldmedicalcenter/main.dart';
import 'package:worldmedicalcenter/presentation/ui/Error.dart';
import 'package:worldmedicalcenter/presentation/ui/reset_password.dart';

import '../../application/blocs/allergy/AllergyBloc.dart';
import '../../application/blocs/allergy/AllergyEvent.dart';
import '../../application/blocs/diagnoses/DiagnosesBloc.dart';
import '../../application/blocs/diagnoses/DiagnosesEvent.dart';
import '../../application/blocs/medicine/MedicineBloc.dart';
import '../../application/blocs/medicine/MedicineEvent.dart';
import '../../application/blocs/vaccine/VaccineBloc.dart';
import '../../application/blocs/vaccine/VaccineEvent.dart';
import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();

    super.dispose();
  }

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueGrey[50],
        ),
        body: Container(
          color: Colors.blueGrey[50],
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login to world Medical Card',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'How would you like to sign-in?',
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              InkWell(
                onTap: googleSignin,
                child: Container(
                  margin:const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  padding:const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/aZqAl.png",
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Sign-in with Google"),
                      ],
                    ),
                  ),
                ),
              ),
              Row(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    height: 1,
                    decoration:const BoxDecoration(color: Colors.black),
                  ),
                ),
                const Text("OR"),
                Expanded(
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    height: 1,
                    decoration:const BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(children: [
                  const SizedBox(height: 12),
                  TextField(
                    key:const Key("Email"),
                    controller: emailCtrl,
                    textInputAction: TextInputAction.next,
                    decoration:const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text("Email"),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    key:const Key("Password"),
                    controller: passwordCtrl,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        label:const Text('Password'),
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            })),
                    obscureText: _isObscure,
                  ),
                ]),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          child:const Text(
                            'Forgot Password?',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PasswordReset();
                            }));
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        key:const Key("Login"),
                          onPressed: signIn,
                          child: Container(
                            padding:const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 130),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.blue,
                            ),
                            child:const Text(
                              'LOGIN',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )
                          )
                          
                          ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future signIn() async {
    bool flag = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) => const Center(child: CircularProgressIndicator())));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailCtrl.text.trim(), password: passwordCtrl.text.trim());
    } on FirebaseAuthException {
      flag = false;
    }

    if (!flag) {
      const snackBar = SnackBar(
        content: Text("Incorrect email or password",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const Login())));
    } else {
      // ignore: use_build_context_synchronously
      final allergyBloc = BlocProvider.of<AllergyBloc>(context);
      allergyBloc.add(LoadAllergy("1"));
      // ignore: use_build_context_synchronously
      final medicineBloc = BlocProvider.of<MedicineBloc>(context);
      medicineBloc.add(LoadMedicine("1"));
      // ignore: use_build_context_synchronously
      final diagnosesBloc = BlocProvider.of<DiagnosesBloc>(context);
      diagnosesBloc.add(LoadDiagnoses("1"));
      // ignore: use_build_context_synchronously
      final vaccineBloc = BlocProvider.of<VaccineBloc>(context);
      vaccineBloc.add(LoadVaccine("1"));

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const HomePage())));
    }
  }

  Future googleSignin() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) => const Center(child: CircularProgressIndicator())));

    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // ignore: use_build_context_synchronously
    final allergyBloc = BlocProvider.of<AllergyBloc>(context);
    allergyBloc.add(LoadAllergy("1"));
    // ignore: use_build_context_synchronously
    final medicineBloc = BlocProvider.of<MedicineBloc>(context);
    medicineBloc.add(LoadMedicine("1"));
    // ignore: use_build_context_synchronously
    final diagnosesBloc = BlocProvider.of<DiagnosesBloc>(context);
    diagnosesBloc.add(LoadDiagnoses("1"));
    // ignore: use_build_context_synchronously
    final vaccineBloc = BlocProvider.of<VaccineBloc>(context);
    vaccineBloc.add(LoadVaccine("1"));

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const HomePage())));
  }
}

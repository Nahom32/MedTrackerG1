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
  Login({Key? key}) : super(key: key);

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
              Text(
                'Login to world Medical Card',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'How would you like to sign-in?',
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              InkWell(
                onTap: googleSignin,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 40, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/aZqAl.png",
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Sign-in with Google"),
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
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ),
                Text("OR"),
                Expanded(
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    height: 1,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(children: [
                  SizedBox(height: 12),
                  TextField(
                    controller: emailCtrl,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text("Email"),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: passwordCtrl,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        label: Text('Password'),
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          child: Text(
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
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: signIn,
                          child: Container(
                            child: Text(
                              'LOGIN',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 130),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.blue,
                            ),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.all(Radius.circular(30))
                            // ),
                          )
                          // ,
                          ),
                      SizedBox(
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
        builder: ((context) => Center(child: CircularProgressIndicator())));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailCtrl.text.trim(), password: passwordCtrl.text.trim());
    } on FirebaseAuthException catch (e) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailCtrl.text.trim(), password: passwordCtrl.text.trim());
      } on Exception catch (e) {
        flag = false;
      }
    }

    if (!flag) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => ErrorPage())));
    } else {
      final allergyBloc = BlocProvider.of<AllergyBloc>(context);
      allergyBloc.add(LoadAllergy("1"));
      final medicineBloc = BlocProvider.of<MedicineBloc>(context);
      medicineBloc.add(LoadMedicine("1"));
      final diagnosesBloc = BlocProvider.of<DiagnosesBloc>(context);
      diagnosesBloc.add(LoadDiagnoses("1"));
      final vaccineBloc = BlocProvider.of<VaccineBloc>(context);
      vaccineBloc.add(LoadVaccine("1"));

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => HomePage())));
    }
  }

  Future googleSignin() async {
    GoogleSignIn().signIn();
  }
}

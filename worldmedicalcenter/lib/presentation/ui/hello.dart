import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ui/login.dart';


class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(image: AssetImage('assets/medical-card-phone.png'), height: 350,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children:[
                const Text('World Medical Card', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                const Text('YOUR PERSONAL MEDICAL RECORD ALWAYS AVAILABLE', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black54),)
              ]
            ),
            TextButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return Login();
              }));
            },
            // onPressed: () {
            //   final allergyBloc = BlocProvider.of<AllergyBloc>(context);
            //   allergyBloc.add(LoadAllergy(1));
            //   final medicineBloc = BlocProvider.of<MedicineBloc>(context);
            //   medicineBloc.add(LoadMedicine(1));
            //   final diagnosesBloc = BlocProvider.of<DiagnosesBloc>(context);
            //   diagnosesBloc.add(LoadDiagnoses(1));
            //   final vaccineBloc = BlocProvider.of<VaccineBloc>(context);
            //   vaccineBloc.add(LoadVaccine(1));
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) {
            //     return HomePage();
            //   }));
            // },
            child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 130),
            decoration: const BoxDecoration(borderRadius:  BorderRadius.all(Radius.circular(30)),
            color:  Colors.blue,
            ),
            child:const Text(
              key: Key("Login"),
              'LOGIN', style: TextStyle(fontSize: 12, color: Colors.white),),
            )
            )
          ],
        ),)
      ),
    );
  }
}
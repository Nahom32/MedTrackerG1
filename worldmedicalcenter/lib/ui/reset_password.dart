
import 'package:flutter/material.dart';
import '../ui/HomePage.dart';



class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Text('Reset Password', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),),
         Text('Please type your email address and press the button to reset your password'),
         Form(child: Column(
          children: [
            TextFormField(
              
            ),
               TextButton(
            onPressed: (){},
            child: Container(
            child:Text('RESET PASSWORD', style: TextStyle(fontSize: 12, color: Colors.white),),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 130),
            decoration: BoxDecoration(borderRadius:  BorderRadius.all(Radius.circular(30)),
            color:  Colors.blue,
            ),
  
          )
          
          )


          ],
         ))

        ],
      ),
    );
  }
}



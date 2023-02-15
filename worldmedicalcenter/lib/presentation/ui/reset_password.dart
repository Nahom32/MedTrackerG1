
import 'package:flutter/material.dart';
import '../ui/HomePage.dart';



class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

         const SizedBox(height: 100),
         const Text('Reset Password', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
         const Text('Please type your email address and press the button to reset your password'),
         const SizedBox(height: 30,),
         Form(child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
  ),),
            const SizedBox(
              height: 30
            ),
            
               TextButton(
            onPressed: (){},
            child: Container(
            padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 130),
            decoration: const BoxDecoration(borderRadius:  BorderRadius.all(Radius.circular(30)),
            color: Colors.blue,
            ),
            child: const Text('RESET PASSWORD', style: TextStyle(fontSize: 12, color: Colors.white),),
  
          )
          
          )


          ],
         ))

        ],
      ),
    );
  }
}



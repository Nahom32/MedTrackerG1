
import 'package:flutter/material.dart';
import '../ui/HomePage.dart';



class PasswordReset extends StatefulWidget {
  PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

         SizedBox(height: 100),
         Text('Reset Password', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
         Text('Please type your email address and press the button to reset your password'),
         SizedBox(height: 30,),
         Form(child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
  ),),
            SizedBox(
              height: 30
            ),
            
               TextButton(
            onPressed: (){print('object');},
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



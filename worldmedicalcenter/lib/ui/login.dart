import 'package:flutter/material.dart';
import 'package:worldmedicalcenter/ui/HomePage.dart';



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
          Text('Login to world Medical Card', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text('How would you like to sign-in?', style: TextStyle(fontSize: 11, color: Colors.black54),),
          TextButton(onPressed: (){}, child: Text('Sign-in with google')),

   Row(children: [
            Expanded(
              child: Container(
                  margin:const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: Divider(
                    color: Colors.black,
                    height: 50,
                  )),
            ),
 
            Text("OR"),
 
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                  child: Divider(
                    color: Colors.black,
                    height: 50,
                  )),
            ),
            
          ]),

TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomePage();
            }));
          }, 
              child: Text('login'))

        ],
      ),
    );
  }
}
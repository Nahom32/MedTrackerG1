import 'package:flutter/material.dart';
import 'package:worldmedicalcenter/ui/HomePage.dart';
import 'package:worldmedicalcenter/ui/reset_password.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 50,),
        Text(
          'Login to world Medical Card',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'How would you like to sign-in?',
          style: TextStyle( color: Colors.black54),
        ),
          //    TextButton(
          // onPressed: (){
          //   Navigator.push(context, MaterialPageRoute(builder: (context){
          //     return HomePage();
          //   }));
          // }, 
          // child: Container(
          // child:Text('Sign-in with Google', style: TextStyle(fontSize: 12, color: Colors.black),),
          // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 150),
          // decoration: BoxDecoration(borderRadius:  BorderRadius.all(Radius.circular(5)),
          // color:  Colors.white54,
          // ),
          // )
          // ),

          Container(
            width:300,
            height:40,
            decoration: BoxDecoration(color: Colors.black12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children:[
                Container(
                  
                    child:
                    Image(image: AssetImage('../../assets/google-icon-removebg-preview.png'),
                    // fit: BoxFit.cover,
                    width: 20,
                    )               
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text('Sign-in with Google')
              ],
            ),
          ),


        Row(children: [
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 15.0),
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
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 12
              ),
              TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
  ),
),
SizedBox(height: 12,),
TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Password',
    suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    })
  ),
  obscureText: _isObscure,

),



        ]),),
        SizedBox(height: 130,),
        Positioned(bottom: 12,child: Column(children: [
          GestureDetector(
            child: Text('Forgot Password?', style: TextStyle(decoration: TextDecoration.underline),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PasswordReset();
              }));
            }),
           TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomePage();
            }));
          }, 
          child: Container(
          child:Text('LOGIN', style: TextStyle(fontSize: 12, color: Colors.white),),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 130),
          decoration: BoxDecoration(borderRadius:  BorderRadius.all(Radius.circular(30)),
          color:  Colors.blue,
          ),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(30))
          // ),
          )
          // ,
          )

        ],))
        
      ],
    ));
  }
}

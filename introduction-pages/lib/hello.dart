import 'package:flutter/material.dart';
import 'package:med/login.dart';


class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage('assets/medical-card-phone.png'), height: 350,),
          Container(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text('World Medical Card', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('YOUR PERSONAL MEDICAL RECORD ALWAYS AVAILABLE', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black54),)
            ]
          ),),
          TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Login();
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
        ],
      ),)
    );
  }
}
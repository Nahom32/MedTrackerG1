
import 'package:flutter/material.dart';
import '../ui/HomePage.dart';
import '../ui/hello.dart';
import '../ui/intro_1.dart';
import '../ui/intro_3.dart';
import '../ui/intro_2.dart';
import '../ui/splash.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/add": (context) => Add()},
      title: 'World Medical App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // backgroundColor: Color.fromARGB(255, 180, 231, 255),
        primaryTextTheme: const TextTheme(
            bodyText1: TextStyle(fontFamily: "Nunito Sans", fontSize: 10)),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            // borderSide: BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }

}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController();


  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
        controller: _controller,
        onPageChanged: (index){
          setState(() {
            onLastPage = (index == 2);
          });
        },
        children: [
          
        IntroductionOne(),
        IntroductionTwo(),
        IntroductionThree(),
          
        ],
       ),
       Container(child:SmoothPageIndicator(
        controller: _controller, count: 3,
        effect: WormEffect(
          activeDotColor: Colors.black,
          dotColor: Colors.black,
          dotHeight: 5,
          dotWidth: 5
        )),
       alignment: Alignment(0,0),
       ),
       Container(child: Image(image: AssetImage('../../assets/world-medical-card-removebg-preview.png'),
       height: 40,),
       alignment: Alignment(0,-0.9),
      ),


      
        GestureDetector(
          onTap: () {
            
          },
        child: Container(child: onLastPage? TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Hello();
            }));
          }, 
          child: Container(child:Text('NEXT', style: TextStyle(fontSize: 12, color: Colors.white),),
          
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 130),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),color: Colors.blue),
          // color: Colors.blue,
          )
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(30))
          // ),
          ):GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Hello();
              }));
            },
            child: Text('Skip Tour', style: TextStyle(fontSize: 12),),),
        alignment: Alignment(0,0.8),
        ),)
        ],),
    );
  }
}
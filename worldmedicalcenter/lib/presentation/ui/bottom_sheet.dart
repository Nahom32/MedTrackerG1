
import 'package:flutter/material.dart';
import 'package:worldmedicalcenter/presentation/ui/my_subscripitons.dart';
import 'package:worldmedicalcenter/presentation/ui/terms_and_conditions.dart';

class Bottom extends StatefulWidget {
  Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){showModalBottomSheet(
          context: context,
          elevation: 5,
          backgroundColor: Colors.blueGrey[900],
          isScrollControlled: true,
          builder: ((context) {
            return Container(
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Subscriptions();
                        }));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "My Subscriptions",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )),
                  InkWell(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return TermsAndConditions();
                        }));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Terms And Conditions",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )),
                  InkWell(
                      onTap: (() {
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Sign Out",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )),
                ],
              ),
            );
          }));
          } 
          
    );
  }
}
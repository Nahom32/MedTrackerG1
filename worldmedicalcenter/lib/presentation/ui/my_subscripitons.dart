

import 'package:flutter/material.dart';

class Subscriptions extends StatefulWidget {
  Subscriptions({Key? key}) : super(key: key);

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Text('My Subscriptions', style: TextStyle(fontSize: 25),),
            Text('Current Subscription(1)', style: TextStyle(fontWeight: FontWeight.bold),),
            Card(
            
              child: Column(children: [
                Container(
                  child: Text('Personling sikkerhet (maned)', style: TextStyle(color: Colors.white),),
                  color: Colors.blueAccent,
                  padding: EdgeInsets.fromLTRB(10, 5, 55, 5),
                ),
                Text('Subscription Manager:'),
                Text('Membership Occupancy: 0/1'),
                Text('Expired 3/2023')
              ]),
            )
          ],
        ),
      ),
    );
  }
}
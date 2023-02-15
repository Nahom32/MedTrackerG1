

import 'package:flutter/material.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({Key? key}) : super(key: key);

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
            const Text('My Subscriptions', style: TextStyle(fontSize: 25),),
            const Text('Current Subscription(1)', style: TextStyle(fontWeight: FontWeight.bold),),
            Card(
            
              child: Column(children: [
                Container(
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.fromLTRB(10, 5, 55, 5),
                  child: const Text('Personling sikkerhet (maned)', style: TextStyle(color: Colors.white),),
                ),
                const Text('Subscription Manager:'),
                const Text('Membership Occupancy: 0/1'),
                const Text('Expired 3/2023')
              ]),
            )
          ],
        ),
      ),
    );
  }
}
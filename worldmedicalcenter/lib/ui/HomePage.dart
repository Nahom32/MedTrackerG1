import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      "Allergies",
      "Medicine",
      "Diagnoses",
      "Vaccines",
      "Documents",
    ];
    List<Icon> iconList = [
      Icon(Icons.emoji_food_beverage_rounded),
      Icon(Icons.medication),
      Icon(Icons.sd_card),
      Icon(Icons.check_box_sharp),
      Icon(Icons.folder),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Icon(Icons.waving_hand, color: Colors.amber[400]),
              SizedBox(
                width: 10,
              ),
              Text(
                "Good Morning",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          actions: [IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.more_vert), color: Colors.black, iconSize: 20,)],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children : [
                        Row(
                          children: [
                            iconList[index],
                            SizedBox(width: 8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(titleList[index], style: TextStyle(fontSize: 16)),
                                Text("No allergies Listed", style: TextStyle(fontSize: 10, color: Colors.black54),)
                              ],
                            )
                          ],
                        ),
                        Icon(Icons.arrow_drop_down),
                      ]
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

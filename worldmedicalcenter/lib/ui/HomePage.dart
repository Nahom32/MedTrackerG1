import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isDropped = [false, false, false, false, false];
  var showProfile = false;

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
      const Icon(Icons.difference_sharp),
      const Icon(Icons.medication),
      const Icon(Icons.sd_card),
      const Icon(Icons.difference_sharp),
      const Icon(Icons.folder),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[50],
          elevation: 0,
          title: Row(
            children: [
              Icon(Icons.waving_hand, color: Colors.amber[400]),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Good Morning",
                style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              color: Colors.black,
              iconSize: 20,
            )
          ],
        ),
        body: Container(
          color: Colors.blueGrey[50],
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    title: Text("Paulos Dessie"),
                    subtitle: Text("Member since 2022"),
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => {
                      setState((() => isDropped[index] = !isDropped[index]))
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      iconList[index],
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(titleList[index],
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                          Text(
                                            "No allergies Listed",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black54),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  checkDropped(index),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget checkDropped(i) {
    return isDropped[i]
        ? const Icon(Icons.arrow_drop_up)
        : const Icon(Icons.arrow_drop_down);
  }
  Widget checkShowProfile() {
    return showProfile
        ? const Icon(Icons.arrow_drop_up)
        : const Icon(Icons.arrow_drop_down);
  }
}

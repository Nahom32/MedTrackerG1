import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      "profile",
      "Allergies",
      "Medicine",
      "Diagnoses",
      "Vaccines",
      "Documents",
    ];

    List<Icon> iconList = [
      const Icon(Icons.no_accounts_rounded),
      const Icon(Icons.difference_sharp),
      const Icon(Icons.medication),
      const Icon(Icons.sd_card),
      const Icon(Icons.difference_sharp),
      const Icon(Icons.folder),
    ];

    List buttonList = [
      [
        "Translate",
        Icon(
          CupertinoIcons.globe,
          size: 20,
        )
      ],
      [
        "Add",
        Icon(
          Icons.add,
          size: 20,
        )
      ],
      [
        "Edit",
        Icon(
          Icons.edit,
          size: 20,
        )
      ],
      [
        "Share",
        Icon(
          Icons.share,
          size: 20,
        )
      ]
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[50],
          elevation: 0,
          title: appbarHeader(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              color: Colors.black,
              iconSize: 24,
            )
          ],
        ),
        body: Container(
          color: Colors.blueGrey[50],
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return getProfile();
              } else if (index == 6) {
                return getExpirationCard();
              }
              return ExpandableNotifier(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ScrollOnExpand(
                          child: ExpandablePanel(
                            header:
                                getExpandableHeader(iconList, titleList, index),
                            collapsed: SizedBox.shrink(),
                            expanded: getExpandedContent(buttonList),
                          ),
                        ),
                      ),
                    )),
              );
            },
          ),
        ),
      ),
    );
  }

  appbarHeader() {
    return Row(
      children: [
        Icon(
          Icons.waving_hand,
          color: Colors.amber[400],
          size: 24,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "Good Morning",
          style: const TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );
  }

  Widget getProfile() {
    return Padding(
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
    );
  }

  Widget getExpirationCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 190,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/wmc.png",
              width: double.maxFinite,
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 13),
              child: Text("Card will Expire in 208 days"),
            ),
          ],
        ),
      ),
    );
  }

  getExpandableHeader(iconList, titleList, index) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          iconList[index],
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleList[index], style: const TextStyle(fontSize: 18)),
              SizedBox(
                height: 2,
              ),
              Text(
                "No allergies Listed",
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              )
            ],
          )
        ],
      ),
    );
  }

  getExpandedContent(buttonList) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8, left: 3, right: 3),
            height: 1,
            color: Colors.blueGrey[200],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Saccharomyces ellipsoideus dkhasdasb dsakdsahbd khasgdhsa hdsagdhasgdh",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "WMCX0002",
                          style: TextStyle(
                              color: Colors.black45,
                              // fontWeight:
                              //     FontWeight.w200,
                              fontSize: 12),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: getButtons(buttonList),
          ),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }

  getButtons(buttonList) {
    return ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: (() => handleButton(index)),
              borderRadius: BorderRadius.circular(100),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        width: 0.5,
                        color: Colors.black45,
                        style: BorderStyle.solid)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonList[index][1],
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      buttonList[index][0],
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  handleButton(int index) {
    if (index == 0) {
      List<String> languageList = ["English", "French", "Italian", "Spanish"];
      var dropdownValue = languageList[0];

      showModalBottomSheet<void>(
        context: context,
        elevation: 5,
        backgroundColor: Colors.blueGrey[50],
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(12),
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Allergies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: DropdownButton<String>(
                      underline: SizedBox.shrink(),
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      value: dropdownValue,
                      items: languageList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            // style: TextStyle(fontSize: 30),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                //Translated version starts here
                Text(
                  'My Allergies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 4,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  // borderRadius: BorderRadius.circular(5)
                                ),
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Hazelnut Tree pollen',
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                elevation: 2,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hazelnut Tree pollen",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Row(
                                          children: [Text("code: WMCX0001")],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        })),
                  ),
                )
              ],
            ),
          );
        },
      );
    } else if (index == 1) {
      Navigator.pushNamed(context, "/add");
    } else if (index == 2) {
    } else {}
  }
}

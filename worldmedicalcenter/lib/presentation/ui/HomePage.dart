import 'package:expandable/expandable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:worldmedicalcenter/presentation/ui/my_subscripitons.dart';
import 'package:worldmedicalcenter/presentation/ui/splash.dart';
import 'package:worldmedicalcenter/presentation/ui/terms_and_conditions.dart';

import '../../application/blocs/allergy/AllergyBloc.dart';

import '../../application/blocs/allergy/AllergyBloc.dart';
import '../../application/blocs/allergy/AllergyEvent.dart';
import '../../application/blocs/allergy/AllergyState.dart';
import '../../application/blocs/diagnoses/DiagnosesBloc.dart';
import '../../application/blocs/diagnoses/DiagnosesEvent.dart';
import '../../application/blocs/diagnoses/DiagnosesState.dart';
import '../../application/blocs/medicine/MedicineBloc.dart';
import '../../application/blocs/medicine/MedicineEvent.dart';
import '../../application/blocs/medicine/MedicineState.dart';
import '../../application/blocs/vaccine/VaccineBloc.dart';
import '../../application/blocs/vaccine/VaccineEvent.dart';
import '../../application/blocs/vaccine/VaccineState.dart';
import '../ui/editPersonalInfo.dart';
import '../../domain/models/NormalModel.dart';
import '../../domain/models/PersonalInfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var showChecklist = false;
  var dropdownValue = "French";
  PlatformFile? pickedFile;

  List<String> titleList = [
    "profile",
    "Allergies",
    "Medicine",
    "Diagnoses",
    "Vaccines",
    "Documents",
  ];
  PersonalInfo testInfo = PersonalInfo(
      id: 01,
      firstName: "Paulos",
      lastName: "Dessie",
      DOB: "04 Nov 2099",
      organDonor: "Yes",
      gender: "Male",
      SSN: "1111111",
      nationality: "Norwegian",
      Tlf_nr: "426782454",
      postNtr: "Alvovlien",
      land: "Norway",
      streetAddress: "579, Godvik",
      TOI: "String",
      policyNumber: "String",
      alarmTelephone: "String",
      emergenyName: "bora bora",
      phoneNum: "943759027",
      relationship: "whatttttt",
      other: "adhfj dsagfjhkg jhsdgajhgf jkasdgfjkasdgfhjdgsf kjgajsdfgk");
  var ischecked = <bool?>[];
  List<NormalModel> toBeRemoved = [];
  List buttonList = [
    [
      "Translate",
      const Icon(
        CupertinoIcons.globe,
        size: 20,
      )
    ],
    [
      "Add",
      const Icon(
        Icons.add,
        size: 20,
      )
    ],
    [
      "Edit",
      const Icon(
        Icons.edit,
        size: 20,
      )
    ],
    [
      "Share",
      const Icon(
        Icons.share,
        size: 20,
      )
    ]
  ];
  List<String> languageList = ["English", "French", "Italian", "Spanish"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        elevation: 0,
        automaticallyImplyLeading: false,
        title: appbarHeader(),
        actions: [
          IconButton(
            onPressed: () {
              //adding navigation to the menu
              showModalBottomSheet(
                  context: context,
                  elevation: 5,
                  backgroundColor: Colors.blueGrey[900],
                  isScrollControlled: true,
                  builder: ((context) {
                    return Container(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: (() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Subscriptions();
                                }));
                              }),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "My Subscriptions",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                              onTap: (() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TermsAndConditions();
                                }));
                              }),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Terms And Conditions",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                              onTap: () async{
                              await GoogleSignIn().signOut();
                              FirebaseAuth.instance.signOut();
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Splash())));
                            },
                            child: const Padding(
                                padding: EdgeInsets.only(left: 10.0),
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
            },
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
            return getMainField(index);
          },
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
        const Text(
          "Good Morning",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );
  }

  Widget getProfile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ExpandablePanel(
            key: const Key("PersonalInfo"),
            header: ListTile(
              title: Text(testInfo.firstName! + testInfo.lastName!),
              subtitle: const Text("Member since 2022"),
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
            collapsed: Container(),
            expanded: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getPersonnalinfo(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      child: const DecoratedBox(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 236, 236, 236))),
                    ),
                  ),
                  getInsuranceInfo(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      child: const DecoratedBox(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 236, 236, 236))),
                    ),
                  ),
                  getEmregencyContact(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
<<<<<<< HEAD
                      child: const DecoratedBox(
=======
                      child:const DecoratedBox(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 236, 236, 236))),
                    ),
                  ),
                  getOtherInfo(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: InkWell(
<<<<<<< HEAD
                        key: const Key("EditPersonal"),
=======
                        key:const Key("EditPersonal"),
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                        onTap: () async {
                          var newInfo = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditPersonalInfo(testInfo),
                            ),
                          );

                          setState(() {
                            testInfo = newInfo;
                          });
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
<<<<<<< HEAD
                            padding: const EdgeInsets.symmetric(
=======
                            padding:const EdgeInsets.symmetric(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                                horizontal: 20, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    width: 0.5,
                                    color: Colors.black45,
                                    style: BorderStyle.solid)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buttonList[2][1],
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  buttonList[2][0],
<<<<<<< HEAD
                                  style: const TextStyle(
=======
                                  style:const TextStyle(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                                      fontSize: 14, color: Colors.black),
                                )
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getPersonnalinfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [basicText("Birth Date"), Text(testInfo.DOB)],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [basicText("Gender"), Text(testInfo.gender)],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [basicText("Orgad donor"), Text(testInfo.organDonor)],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  basicText("Social Security Number"),
                  Text(testInfo.SSN)
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  basicText("Nationality"),
                  Text(testInfo.nationality)
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [basicText("Telephone"), Text(testInfo.Tlf_nr)]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  basicText("Postal Address"),
                  Text(testInfo.postNtr),
                  Text(testInfo.streetAddress),
                  Text(testInfo.land)
                ]),
          ),
        ),
      ],
    );
  }

  Widget getInsuranceInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [basicText("Travel Insurance"), Text(testInfo.TOI)],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  basicText("Policy Number"),
                  Text(testInfo.policyNumber)
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  basicText("Alarm Telephone"),
                  Text(testInfo.alarmTelephone)
                ]),
          ),
        )
      ],
    );
  }

  Widget getEmregencyContact() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          basicText("Emergency Contacts"),
          Text(testInfo.emergenyName + testInfo.relationship),
          Text(testInfo.phoneNum)
        ],
      ),
    );
  }

  Widget getOtherInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [basicText("Other information"), Text(testInfo.other)],
      ),
    );
  }

  Widget basicText(text) {
    return Text(
      text,
<<<<<<< HEAD
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
=======
      style:const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
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
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13),
              child: Text("Card will Expire in 208 days"),
            ),
          ],
        ),
      ),
    );
  }

  getExpandableHeader(index, state) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getIcon(index, state),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleList[index], style: const TextStyle(fontSize: 18)),
              const SizedBox(
                height: 2,
              ),
              checkAmount(state),
            ],
          )
        ],
      ),
    );
  }

  getExpandedContent(index, state) {
    if (state.length == 0) {
      return Container(
<<<<<<< HEAD
        margin: const EdgeInsets.symmetric(horizontal: 5),
=======
        margin:const EdgeInsets.symmetric(horizontal: 5),
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
        child: InkWell(
          onTap: (() => handleButton(1, state, 1)),
          borderRadius: BorderRadius.circular(100),
          child: Container(
<<<<<<< HEAD
            margin: const EdgeInsets.only(bottom: 8, top: 3),
=======
            margin:const EdgeInsets.only(bottom: 8, top: 3),
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
            width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    width: 0.5,
                    color: Colors.black45,
                    style: BorderStyle.solid)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonList[1][1],
                const SizedBox(
                  width: 6,
                ),
                Text(
                  buttonList[1][0],
<<<<<<< HEAD
                  style: const TextStyle(fontSize: 14, color: Colors.black),
=======
                  style:const TextStyle(fontSize: 14, color: Colors.black),
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                )
              ],
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8, left: 3, right: 3),
            height: 1,
            color: Colors.blueGrey[200],
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: getDetailedList(index, state)),
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: getButtons(index, state),
          ),
          const SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }

  getButtons(idx, state) {
    if (showChecklist == true) {
      return const SizedBox.shrink();
    }
    return ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: (() => handleButton(index, state, idx)),
              borderRadius: BorderRadius.circular(100),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
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
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      buttonList[index][0],
<<<<<<< HEAD
                      style: const TextStyle(fontSize: 14, color: Colors.black),
=======
                      style:const TextStyle(fontSize: 14, color: Colors.black),
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  handleButton(int index, state, idx) {
    if (index == 0) {
      showModalBottomSheet<void>(
        context: context,
        elevation: 5,
        backgroundColor: Colors.blueGrey[50],
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
<<<<<<< HEAD
            padding: const EdgeInsets.all(12),
=======
            padding:const EdgeInsets.all(12),
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My ${titleList[idx]}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: DropdownButton<String>(
                      underline: const SizedBox.shrink(),
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
                  "My ${titleList[idx]}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
<<<<<<< HEAD
                  child: Container(
                    child: ListView.builder(
                        itemCount: state.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 4,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  // borderRadius: BorderRadius.circular(5)
                                ),
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  state[index].name!,
                                ),
                              ),
                              const SizedBox(
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
                                        state[index]
                                            .name!, //change to translated name
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Row(
                                          children: [
                                            Text("Code: ${state[index].id}")
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        })),
                  ),
=======
                  child: ListView.builder(
                      itemCount: state.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    width: 4,
                                    color: Colors.blue,
                                  ),
                                ),
    
                              ),
                              padding:const EdgeInsets.only(left: 5),
                              child: Text(
                                state[index].name!,
                              ),
                            ),
                            const SizedBox(
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
                                      state[index]
                                          .name!, //change to translated name
                                      style:const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        children: [
                                          Text("Code: ${state[index].id}")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      })),
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                )
              ],
            ),
          );
        },
      );
    } else if (index == 1) {
      Navigator.pushNamed(context, "/add");
    } else if (index == 2) {
      showModalBottomSheet(
          context: context,
          elevation: 5,
          backgroundColor: Colors.blueGrey[900],
          isScrollControlled: true,
          builder: ((context) {
            return SizedBox(
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: (() {
                        setState(() {
                          showChecklist = true;
                        });
                        Navigator.pop(context);
                      }),
<<<<<<< HEAD
                      child: const Padding(
=======
                      child:const Padding(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Remove item(s)",
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
    } else {}
  }

  getDetailedList(idx, state) {
    if (showChecklist == false) {
      return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state[index].name!,
<<<<<<< HEAD
                        style: const TextStyle(
=======
                        style:const TextStyle(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        state[index].id.toString(),
<<<<<<< HEAD
                        style: const TextStyle(
=======
                        style:const TextStyle(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                            color: Colors.black45,
              
                            fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            );
          });
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                if (ischecked.length < state.length) {
                  ischecked.add(false);
                }
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: CheckboxListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state[index].name!,
<<<<<<< HEAD
                              style: const TextStyle(
=======
                              style:const TextStyle(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              state[index].id.toString(),
                              style: const TextStyle(
                                  color: Colors.black45,
                              
                                  fontSize: 12),
                            )
                          ],
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: ischecked[index],
                        onChanged: ((value) {
                          setState(() {
                            if (value == false) {
                              toBeRemoved.remove(state[index]);
                            } else {
                              toBeRemoved.add(state[index]);
                            }
                            ischecked[index] = value;
                          });
                        })));
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap: (() {
                  setState(() {
                    showChecklist = false;
                  });
                }),
<<<<<<< HEAD
                child: const Text(
=======
                child:const Text(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                  "Cancel",
                  style: TextStyle(color: Colors.blue),
                )),
            const SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: (() {
                  setState(() {
                    handleDelete(idx);
                    toBeRemoved = [];
                    ischecked = [];
                    showChecklist = false;
                  });
                }),
                child: const Text(
                  "Remove",
                  style: TextStyle(color: Colors.blue),
                )),
          ],
        )
      ],
    );
  }

  getMainField(int index) {
    if (index == 1) {
      return BlocBuilder<AllergyBloc, AllergyState>(
        builder: (context, state) {
          if (state is LoadedAllergy) {
            return getCommonContent(index, state.allergies);
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } else if (index == 2) {
      return BlocBuilder<MedicineBloc, MedicineState>(
        builder: (context, state) {
          if (state is LoadedMedicine) {
            return getCommonContent(index, state.medicines);
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } else if (index == 3) {
      return BlocBuilder<DiagnosesBloc, DiagnosesState>(
        builder: (context, state) {
          if (state is LoadedDiagnoses) {
            return getCommonContent(index, state.diagnoses);
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } else if (index == 4) {
      return BlocBuilder<VaccineBloc, VaccineState>(
        builder: (context, state) {
          if (state is LoadedVaccine) {
            return getCommonContent(index, state.vaccines);
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } else {
      //@TODO: change by document implementation
      List state = [
        NormalModel(userId: "1", name: "Living will", id: "DCE34x"),
        NormalModel(userId: "1", name: "Living will", id: "DCE34x"),
        NormalModel(userId: "1", name: "Living will", id: "DCE34x"),
        NormalModel(userId: "1", name: "Living will", id: "DCE34x"),
        NormalModel(userId: "1", name: "Living will", id: "DCE34x"),
        NormalModel(userId: "1", name: "Living will", id: "DCE34x"),
        NormalModel(userId: "1", name: "Living will", id: "DCE34x"),
      ];
      return ExpandableNotifier(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                      header: getExpandableHeader(index, state),
                      collapsed: const SizedBox.shrink(),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: ListView.builder(
                                itemCount: state.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.file_copy),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state[index].name,
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  state[index].id,
                                                  style: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const Icon(Icons.more_vert)
                                      ],
                                    ),
                                  );
                                })),
                          ),
                          Container(
<<<<<<< HEAD
                            margin: const EdgeInsets.symmetric(
=======
                            margin:const EdgeInsets.symmetric(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                                horizontal: 35, vertical: 5),
                            child: InkWell(
                              onTap: (() async {
                                final result =
                                    await FilePicker.platform.pickFiles();
                                if (result == null) return;
                                setState(() {
                                  pickedFile = result.files.first;
                                });
                              }),
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
<<<<<<< HEAD
                                margin: const EdgeInsets.only(bottom: 8, top: 3),
                                width: 100,
                                padding: const EdgeInsets.symmetric(
=======
                                margin:const EdgeInsets.only(bottom: 8, top: 3),
                                width: 100,
                                padding:const EdgeInsets.symmetric(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                                    horizontal: 20, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.black45,
                                        style: BorderStyle.solid)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buttonList[1][1],
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      buttonList[1][0],
<<<<<<< HEAD
                                      style: const TextStyle(
=======
                                      style:const TextStyle(
>>>>>>> ca7cb44eec75874d50d4555c5bc79754a3b024fb
                                          fontSize: 14, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            )),
      );
      // Delete upto Here
    }
  }

  getCommonContent(index, state) {
    return ExpandableNotifier(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ScrollOnExpand(
                child: ExpandablePanel(
                  header: getExpandableHeader(index, state),
                  collapsed: const SizedBox.shrink(),
                  expanded: getExpandedContent(index, state),
                ),
              ),
            ),
          )),
    );
  }

  checkAmount(state) {
    if (state.length == 0) {
      return const Text(
        "No allergies Listed",
        style: TextStyle(fontSize: 14, color: Colors.black54),
      );
    } else {
      return Text(
        '${state.length} items: ${state[0].name}...',
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      );
    }
  }

  void handleDelete(idx) {
    if (idx == 1) {
      final allergyBloc = BlocProvider.of<AllergyBloc>(context);
      allergyBloc.add(DeleteAllergy(toBeRemoved));
    } else if (idx == 2) {
      final medicineBloc = BlocProvider.of<MedicineBloc>(context);
      medicineBloc.add(DeleteMedicine(toBeRemoved));
    } else if (idx == 3) {
      final diagnosesBloc = BlocProvider.of<DiagnosesBloc>(context);
      diagnosesBloc.add(DeleteDiagnoses(toBeRemoved));
    } else {
      final vaccineBloc = BlocProvider.of<VaccineBloc>(context);
      vaccineBloc.add(DeleteVaccine(toBeRemoved));
    }
  }

  getIcon(index, state) {
    var selctedColor = state.length >= 1 ? Colors.blue : Colors.black;
    switch (index) {
      case 0:
        return const Icon(
          Icons.no_accounts_rounded,
        );
      case 1:
        return Icon(
          Icons.difference_sharp,
          color: selctedColor,
        );
      case 2:
        return Icon(
          Icons.medication,
          color: selctedColor,
        );
      case 3:
        return Icon(
          Icons.sd_card,
          color: selctedColor,
        );
      case 4:
        return Icon(
          Icons.difference_sharp,
          color: selctedColor,
        );
      case 5:
        return Icon(
          Icons.folder,
          color: selctedColor,
        );
      default:
        return const Icon(Icons.abc);
    }
  }
}

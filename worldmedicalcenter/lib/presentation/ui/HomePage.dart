import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import '../../domain/models/NormalModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var showChecklist = false;
  var dropdownValue = "French";
  List<String> titleList = [
    "profile",
    "Allergies",
    "Medicine",
    "Diagnoses",
    "Vaccines",
    "Documents",
  ];
  var ischecked = <bool?>[];
  List<NormalModel> toBeRemoved = [];
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
  List<String> languageList = ["English", "French", "Italian", "Spanish"];

  @override
  Widget build(BuildContext context) {
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
              return getMainField(index);
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
              SizedBox(
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
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: InkWell(
          onTap: (() => handleButton(1, state, 1)),
          borderRadius: BorderRadius.circular(100),
          child: Container(
            margin: EdgeInsets.only(bottom: 8, top: 3),
            width: 100,
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
                buttonList[1][1],
                SizedBox(
                  width: 6,
                ),
                Text(
                  buttonList[1][0],
                  style: TextStyle(fontSize: 14, color: Colors.black),
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
            margin: EdgeInsets.only(bottom: 8, left: 3, right: 3),
            height: 1,
            color: Colors.blueGrey[200],
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: getDetailedList(index, state)),
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: getButtons(index, state),
          ),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }

  getButtons(idx, state) {
    if (showChecklist == true) {
      return SizedBox.shrink();
    }
    return ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: (() => handleButton(index, state, idx)),
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

  handleButton(int index, state, idx) {
    if (index == 0) {
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
                  'My ${titleList[idx]}',
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
                  "My ${titleList[idx]}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: state.length,
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
                                  state[index].name!,
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
                                        state[index]
                                            .name!, //change to translated name
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
                                          children: [
                                            Text("Code: ${state[index].id}")
                                          ],
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
      showModalBottomSheet(
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
                        setState(() {
                          showChecklist = true;
                        });
                        Navigator.pop(context);
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        state[index].id.toString(),
                        style: TextStyle(
                            color: Colors.black45,
                            // fontWeight:
                            //     FontWeight.w200,
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              state[index].id.toString(),
                              style: TextStyle(
                                  color: Colors.black45,
                                  // fontWeight:
                                  //     FontWeight.w200,
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
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue),
                )),
            SizedBox(
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
                child: Text(
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
            return CircularProgressIndicator();
          }
        },
      );
    } else if (index == 2) {
      return BlocBuilder<MedicineBloc, MedicineState>(
        builder: (context, state) {
          if (state is LoadedMedicine) {
            return getCommonContent(index, state.medicines);
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    } else if (index == 3) {
      return BlocBuilder<DiagnosesBloc, DiagnosesState>(
        builder: (context, state) {
          if (state is LoadedDiagnoses) {
            return getCommonContent(index, state.diagnoses);
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    } else if (index == 4) {
      return BlocBuilder<VaccineBloc, VaccineState>(
        builder: (context, state) {
          if (state is LoadedVaccine) {
            return getCommonContent(index, state.vaccines);
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    } else {
      //@TODO: change by document implementation
      return BlocBuilder<VaccineBloc, VaccineState>(
        builder: (context, state) {
          if (state is LoadedVaccine) {
            return getCommonContent(index, state.vaccines);
          } else {
            return CircularProgressIndicator();
          }
        },
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
      return Text(
        "No allergies Listed",
        style: const TextStyle(fontSize: 14, color: Colors.black54),
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
    var selctedColor = state.length > 1 ? Colors.blue : Colors.black;
    switch (index) {
      case 0:
        return Icon(
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

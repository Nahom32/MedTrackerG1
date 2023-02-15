import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/blocs/personnalInfo/personalInfoBloc.dart';
import '../../application/blocs/personnalInfo/personalInfoState.dart';
import '../../domain/models/PersonalInfo.dart';

class EditPersonalInfo extends StatefulWidget {
  final PersonalInfo prevInfo;
  const EditPersonalInfo(this.prevInfo);

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState(prevInfo);
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  final PersonalInfo prevInfo;
  _EditPersonalInfoState(this.prevInfo);
  @override
  // Form Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final DOBController = TextEditingController();
  final genderController = TextEditingController();
  final SSNController = TextEditingController();
  final nationalityController = TextEditingController();
  final TLFController = TextEditingController();
  final organDonnorController = TextEditingController();
  final postnrController = TextEditingController();
  final cityController = TextEditingController();
  final landController = TextEditingController();
  final streetAddressController = TextEditingController();
  final TOIController = TextEditingController();
  final insuranceCompController = TextEditingController();
  final policyNumController = TextEditingController();
  final alarmTelController = TextEditingController();
  final emergencyName1Controller = TextEditingController();
  final emergencyPhonenum1Controller = TextEditingController();
  final relationship1Controller = TextEditingController();
  final emergencyName2Controller = TextEditingController();
  final emergencyPhonenum2Controller = TextEditingController();
  final relationship2Controller = TextEditingController();
  final otherController = TextEditingController();

  // Gender state holder
  var genderstate = "Male";
  var donorState = "No";
  var insuranceState = "TI";

  final requestText =
      "Please fill your personal information to create an account, you can change them latter";
  Widget build(BuildContext context) {
    return Container(
      color:const Color.fromARGB(255, 250, 250, 250),
      child: Padding(
        padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
                builder: (context, state) {
                  // String adaptiveText = "Save";
                  return Padding(
                    // alignment: Alignment.bottomCenter,
                    padding:const EdgeInsets.symmetric(vertical: 6.0),
                    child: FloatingActionButton.extended(
                      key: Key("Save"),
                      onPressed: () {
                        if (firstNameController.text.isNotEmpty &&
                            // ignore: unrelated_type_equality_checks
                            firstNameController.text != prevInfo.firstName) {
                          prevInfo.firstName = firstNameController.text;
                        }

                        if (lastNameController.text.isNotEmpty) {
                          prevInfo.lastName = lastNameController.text;
                        }

                        if (DOBController.text.isNotEmpty) {
                          prevInfo.DOB = DOBController.text;
                        }

                        if (genderstate != prevInfo.gender) {
                          prevInfo.gender = genderstate;
                        }

                        if (SSNController.text.isNotEmpty &&
                            SSNController.text != prevInfo.SSN) {
                          prevInfo.SSN = SSNController.text;
                        }

                        if (nationalityController.text.isNotEmpty &&
                            nationalityController.text !=
                                prevInfo.nationality) {
                          prevInfo.nationality = nationalityController.text;
                        }

                        Navigator.of(context).pop(prevInfo);
                      },
                      label: Text("Save"),
                    ),
                  );
                },
                listenWhen: (p, c) {
                  return c is Saved;
                },
                listener: (BuildContext ctx, Object? state) {
                  Navigator.of(context).pop(" ");
                },
              )),
          appBar: AppBar(
            elevation: 0,
            backgroundColor:const Color.fromARGB(255, 250, 250, 250),
            leading:const BackButton(color: Colors.grey),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height * 0.78,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          // Title goes below
                          child: Text(
                            "Personnal info",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        // The reuest paragraph goes below
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7.0),
                          child: Text(
                            requestText,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 128, 128, 128),
                                fontSize: 15),
                          ),
                        ),
                        // The below container containes the form for the first name
                        Container(
                          
                          padding:const EdgeInsets.symmetric(vertical: 7),
                          child: TextField(
                            key:const Key("First name"),
                            decoration:const InputDecoration(
                                labelText: "First Name",
                                border: OutlineInputBorder()),
                            controller: firstNameController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        // The below container contains the textfield for the last name
                        Container(
                          
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: TextField(
                            key:const Key("Last name"),
                            decoration:const InputDecoration(
                              labelText: "Last Name",
                              border: OutlineInputBorder(),
                            ),
                            controller: lastNameController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        // the Below container contains row for the DOB and gender fields
                        Container(
                          // width: 300,
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  child: TextField(
                                    key: Key("DOB"),
                                    decoration:const InputDecoration(
                                      
                                        labelText: "Date of Birth",
                                        border: OutlineInputBorder()),
                                    controller: DOBController,
                                    keyboardType: TextInputType.datetime,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  height: 53,
                                  child: Container(
                                    child: DropdownButtonFormField(
                                      key:const Key("Gender drop down"),
                                      value: genderstate,
                                      items: const [
                                        DropdownMenuItem(
                                          key: Key("Male item"),
                                          value: "Male",
                                            child: Text("Male"), ),
                                        DropdownMenuItem(
                                          key: Key("Female item"),
                                            value: "Female",
                                            child: Text("Female"),
                                            )
                                      ],
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                      iconSize: 30.0,
                                      onChanged: (val) {
                                        setState(() {
                                          genderstate = val!;
                                        });
                                      },
                                      decoration:const InputDecoration(
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          padding:const EdgeInsets.symmetric(vertical: 7),
                          child: TextField(
                            key: Key("SSN"),
                            decoration: InputDecoration(
                                labelText: "Social Security Number(Optional)",
                                border: OutlineInputBorder()),
                            controller: SSNController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: TextField(
                            key:const Key("Nationality"),
                            decoration: const InputDecoration(
                                labelText: "Nationality",
                                border: OutlineInputBorder()),
                            controller: nationalityController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.symmetric(vertical: 7),
                          child: TextField(
                            key:const Key("Tlf.nr"),
                            decoration:const InputDecoration(
                                labelText: "Tlf.nr.",
                                border: OutlineInputBorder()),
                            controller: TLFController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Container(
                            padding:const EdgeInsets.symmetric(vertical: 7),
                            child:const Text(
                              "Would you like to be an organ donor?",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            )),
                        Container(
                          padding:const EdgeInsets.symmetric(vertical: 8.0),
                          child: DropdownButtonFormField(
                            key:const Key("DonorState"),
                            value: donorState,
                            items: const[
                              DropdownMenuItem(
                                key: Key("Donor Yes"), value: "Yes",
                                  child: Text("Yes")),
                              DropdownMenuItem(
                                key: Key("Donor No"),
                                value: "No",
                                child: Text("No"),)
                            ],
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            iconSize: 30.0,
                            onChanged: (val) {
                              setState(() {
                                donorState = val!;
                              });
                            },
                            decoration:
                                const InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                            padding:const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 8),
                            child:const Text(
                              "Healthcare proffesionals will be required to ask family to confirm your decision.",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 124, 124, 124),
                                  fontSize: 12),
                            )),
                      ],
                    ),

                    // ============= Next Columns =====================

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          // Title goes below
                          child: Text(
                            "Personnal info",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.symmetric(vertical: 8.0),
                          child: DropdownButtonFormField(
                            key:const Key("TOI"),
                            value: insuranceState,
                            items: const [
                              DropdownMenuItem(
                                key: Key("TI"),
                                value: "TI",
                                  child: Text("Travel Insurance")),
                              DropdownMenuItem(
                                  key: Key("HI"),
                                  value: "HI",
                                  child: Text("Health Insurance"), )
                            ],
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            iconSize: 30.0,
                            onChanged: (val) {
                              setState(() {
                                insuranceState = val!;
                              });
                            },
                            decoration:
                                const InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.symmetric(vertical: 7),
                          child: TextField(
                            decoration: const InputDecoration(
                                labelText: "Insurance Company",
                                border: OutlineInputBorder()),
                            controller: insuranceCompController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.symmetric(vertical: 7),
                          child: TextField(
                            decoration:const InputDecoration(
                                labelText: "Policy number(optional)",
                                border: OutlineInputBorder()),
                            controller: policyNumController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.symmetric(vertical: 7),
                          child: TextField(
                            decoration:const InputDecoration(
                                labelText: "Alarm Telephone(optional)",
                                border: OutlineInputBorder()),
                            controller: alarmTelController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                    // ================= Third Column ===================
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          // Title goes below
                          child: Text(
                            "Emergency Contacts",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.symmetric(vertical: 7),
                          child: TextField(
                            decoration:const InputDecoration(
                                labelText: "Name",
                                border: OutlineInputBorder()),
                            controller: emergencyName1Controller,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                padding: EdgeInsets.symmetric(vertical: 7),
                                child: TextField(
                                  decoration:const InputDecoration(
                                      labelText: "Phone number",
                                      border: OutlineInputBorder()),
                                  controller: emergencyPhonenum1Controller,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                padding: EdgeInsets.symmetric(vertical: 7),
                                child: TextField(
                                  decoration:const InputDecoration(
                                      labelText: "Relationship",
                                      border: OutlineInputBorder()),
                                  controller: relationship1Controller,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: TextField(
                            decoration:const InputDecoration(
                                labelText: "Name",
                                border: OutlineInputBorder()),
                            controller: emergencyName2Controller,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.43,
                              padding: EdgeInsets.symmetric(vertical: 7),
                              child: TextField(
                                decoration:const InputDecoration(
                                    labelText: "Phone number",
                                    border: OutlineInputBorder()),
                                controller: emergencyPhonenum2Controller,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.43,
                              padding: EdgeInsets.symmetric(vertical: 7),
                              child: TextField(
                                decoration:const InputDecoration(
                                    labelText: "Relationship",
                                    border: OutlineInputBorder()),
                                controller: relationship2Controller,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ================== LAST SECTION(OTHERS) ===============
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          // Title goes below
                          child: Text(
                            "Other",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 5,
                            maxLines: 5,
                            decoration:const
                                InputDecoration(border: OutlineInputBorder()),
                            controller: otherController,
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

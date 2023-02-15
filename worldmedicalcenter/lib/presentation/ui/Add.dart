import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchCtrl.addListener(getResultCard);
  }

  @override
  Widget build(BuildContext context) {
    var showResult = false;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Add New Vaccine",
          ),
          titleTextStyle: const TextStyle(color: Colors.black),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.blueGrey[50],
        ),
        body: Container(
          color: Colors.blueGrey[50],
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: searchCtrl,
                onChanged: (value) {
                  setState(() {
                    showResult = !showResult;
                    // final allergyBloc = BlocProvider.of<AllergyBloc>(context)
                    // allergyBloc.add(SearchEvent(searchCtrl.text.trim()))
                  });
                },
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    label: Text("search")),
              ),
              const SizedBox(height: 20,),
              getResultCard()
            ],
          ),
        ),
      ),
    );
  }

  getResultCard() {
    if (searchCtrl.text == null || searchCtrl.text == "") {
      return const SizedBox.shrink();
    }
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Saccharomyces ellips",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
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
          })),
    );
  }
}

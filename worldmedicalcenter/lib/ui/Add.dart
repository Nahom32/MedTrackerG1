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
          title: Text(
            "Add New Vaccine",
          ),
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
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
                  });
                },
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    label: Text("search")),
              ),
              SizedBox(height: 20,),
              getResultCard()
            ],
          ),
        ),
      ),
    );
  }

  getResultCard() {
    if (searchCtrl.text == null || searchCtrl.text == "") {
      return SizedBox.shrink();
    }
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                children: [
                  Text(
                    "Saccharomyces ellips",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  SizedBox(
                    height: 3,
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
          })),
    );
  }
}

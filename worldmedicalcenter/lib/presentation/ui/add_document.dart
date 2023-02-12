

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';


class AddDocument extends StatefulWidget {
  AddDocument({Key? key}) : super(key: key);

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  PlatformFile? pickedFile;
  // void openFile(PlatformFile file){
  //   OpenFile.open(file.path!);
  // }
  SelectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(children: [
          if (pickedFile != null)
          GestureDetector(
            child: Container(
            padding: EdgeInsets.fromLTRB(150, 15, 150, 15),
            child:Text(pickedFile!.name),
            decoration: BoxDecoration(border: Border.all()),
            ),
            onTap: (){
              SelectFile();
            },
          ),
          
         

                Form(
            // key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 12
                ),
                TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Document Title',
  ),
),
SizedBox(height: 12,),
TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Description(optional)',
   
  ),
),

 ElevatedButton(child: Text('pick file'),
        onPressed: () {
            SelectFile();
        },),



          ]),
          ),
          Expanded(child:  TextButton(
              onPressed: (){},
              child: Container(
              child:Text('UPLOAD NEW DOCUMENT', style: TextStyle(fontSize: 12, color: Colors.white),),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 130),
              decoration: BoxDecoration(borderRadius:  BorderRadius.all(Radius.circular(30)),
              color:  Colors.blue,
              ),)) )
        ],),
      )
    );
}
}




import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';


class AddDocument extends StatefulWidget {
  const AddDocument({Key? key}) : super(key: key);

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  PlatformFile? pickedFile;

  // ignore: non_constant_identifier_names
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
            padding: const EdgeInsets.fromLTRB(150, 15, 150, 15),
            decoration: BoxDecoration(border: Border.all()),
            child:Text(pickedFile!.name),
            ),
            onTap: (){
              SelectFile();
            },
          ),
          
         

                Form(
            // key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 12
                ),
                const TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Document Title',
  ),
),
const SizedBox(height: 12,),
const TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Description(optional)',
   
  ),
),

 ElevatedButton(child: const Text('pick file'),
        onPressed: () {
            SelectFile();
        },),



          ]),
          ),
          Expanded(child:  TextButton(
              onPressed: (){},
              child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 130),
              decoration: const BoxDecoration(borderRadius:  BorderRadius.all(Radius.circular(30)),
              color:  Colors.blue,
              ),
              child:const Text('UPLOAD NEW DOCUMENT', style: TextStyle(fontSize: 12, color: Colors.white),),)) )
        ],),
      )
    );
}
}


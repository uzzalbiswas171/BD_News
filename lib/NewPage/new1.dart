import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stotext/NewPage/new2.dart';

class new1 extends StatefulWidget {
  const new1({Key? key}) : super(key: key);

  @override
  State<new1> createState() => _new1State();
}

class _new1State extends State<new1> {
  TextEditingController _AgeContr=TextEditingController();
  TextEditingController _nContr=TextEditingController();
  @override
  Widget build(BuildContext context) {


    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({ // Stokes and Sons
        'Email': _AgeContr.text, // 42
        'Pass': _AgeContr.text ,// 42
      });
    }
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            TextFormField(
              controller: _AgeContr,
              decoration: InputDecoration(
                hintText: "Enter email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22)
                  )
              ),
            ),
            TextFormField(
              controller: _nContr,
              decoration: InputDecoration(
                  hintText: "Enter Pass",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22)
                  )
              ),
            ),
            SizedBox(height: 10,),
            TextButton(
              onPressed: addUser,
              child: Text(
                "Add User",
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserInformation(),));
            }, child: Text("NextPage"))
          ],
        ),
      ),
    );
  }
}

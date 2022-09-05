
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stotext/EditTextFieldPage/text_fiels_page.dart';
import 'package:stotext/NewPage/new1.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  Future <void> DeleteDocument(selectedDocumentId){
    return FirebaseFirestore.instance.collection("users").doc(selectedDocumentId).delete();
  }
  TextEditingController _EmailController=TextEditingController();
  TextEditingController _passController=TextEditingController();
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Container(
                color: Colors.green,
                margin: EdgeInsets.all(20),
                height: 400,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Colors.black
                          )
                      ),
                      margin: EdgeInsets.all(10),
                      child: EditTextFieldPage(
                        hintText: "Enter email",
                          maxLine: 1,
                          prefixicon: Icon(Icons.email_outlined),
                          controlle: _EmailController,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black)),
                      child: EditTextFieldPage(
                        hintText: "Enter pass",
                          maxLine: 1,
                          prefixicon: Icon(Icons.visibility_off),
                          controlle: _passController),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(data["Email"]),
                          Text(data["Pass"]),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.amberAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){
                           if(_EmailController.text==data["Email"]&&_passController.text==data["Pass"]){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => new1(),));
                           }
                          }, child: Text("Add Admin")),
                          ElevatedButton(onPressed: (){

                          }, child: Text("Addmin Page")),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.amberAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){
                            if(_EmailController.text==data["Email"]&&_passController.text==data["Pass"]){
                              FirebaseFirestore.instance.collection("users").doc(document.id).delete();
                            }
                          }, child: Text("Delete Employe")),
                          ElevatedButton(onPressed: (){

                          }, child: Text("Addmin Page")),
                        ],
                      ),
                    ),


                  ],
                ),
              );

                  
            }).toList(),
          );
        },
      ),
    );
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stotext/HomePage/homepage.dart';
import 'package:stotext/StreambuilderPage/streambuilder.dart';
class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List  Categorylist=[
    {'Catagoryname':"বিশেষ সংবাদ"},
    {'Catagoryname':"রাজনীতি"},
    {'Catagoryname':"বাংলাদেশ"},
    {'Catagoryname':"বিশ্ব"},
    {'Catagoryname':"চাকরি"},
    {'Catagoryname':"জীবনযাপন"},
    {'Catagoryname':"বিনোদন"},
    {'Catagoryname':"বাণিজ্য"},
    {'Catagoryname':"মতামত"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
      appBar: AppBar(
       centerTitle: true,
       leading: IconButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
       }, icon: Icon(Icons.home,size: 32,)),
       title: Text("Amin home Page"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount:Categorylist.length,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: 100,
                alignment: Alignment.center,
                color: Colors.amberAccent,

                child:StreambuilderPage(
                  SEEMORE: "Coustomize",
                  Collectonname: Categorylist[index]["Catagoryname"],
                  SEE_DELE:(){
                       showDialog(context: context, builder: (BuildContext context){
                         return AlertDialog(
                           title: Text("Select your option"),
                           actions: [
                             Container(
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   ElevatedButton(onPressed: (){
                                //    FirebaseFirestore.instance.collection("${Categorylist[index]["Catagoryname"]}").doc(document.id).delete();
                                   }, child: Text("Delete")),
                                   ElevatedButton(onPressed: (){}, child: Text("Edit")),
                                 ],
                               ),
                             ),
                             Container(
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   ElevatedButton(onPressed: (){
                                     Navigator.pop(context);
                                   }, child: Text("cancle")),
                                   ElevatedButton(onPressed: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                   }, child: Text("Home")),
                                 ],
                               ),
                             ),
                           ],
                         );
                       });
                  },
                ),
              );
            }),
      ),
    );
  }
}

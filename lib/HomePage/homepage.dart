import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stotext/AdminPage/NewsUploadPage/newsuploadpage.dart';
import 'package:stotext/AdminPage/adminloginpage.dart';
import 'package:stotext/StreambuilderPage/streambuilder.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsUpload_Page(),));
        }, icon: Icon(Icons.account_circle_outlined,size: 33,color: Colors.black,)),
        backgroundColor: Colors.white,
        title: Text("BD News",style: TextStyle(
          fontSize: 20,color: Colors.black,
          fontWeight: FontWeight.w600,
        ),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLoginPage(),));
          }, icon: Icon(Icons.notifications,size: 33,color: Colors.black,))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child:Container(
          alignment: Alignment.center,
          color: Colors.grey,
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Categorylist.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                 //   Navigator.push(context, MaterialPageRoute(builder: (context) => NewsUpload_Page(),));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(22)
                    ),
                    height: 50,
                    width: 150,
                    margin: EdgeInsets.all(5),
                    child:  Text("${Categorylist[index]["Catagoryname"]}",style: TextStyle(
                    color: Colors.white,
                     ),
                    ),
                  ),
                );
              }
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
            itemCount:Categorylist.length,
             itemBuilder:(context,index){
              return Container(
                margin: EdgeInsets.only(
                bottom: 5,
              ),
                color: Colors.green,
                height: 400,
                width: double.infinity,
                child: StreambuilderPage(
                  SEEMORE: "See more",
                  Collectonname: Categorylist[index]["Catagoryname"],
                ),
              );
             } ,
        ),
      ),
    );
  }
}

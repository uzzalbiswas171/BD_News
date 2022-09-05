
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stotext/EditTextFieldPage/text_fiels_page.dart';
import 'package:stotext/NewPage/new1.dart';

class NewsUpload_Page extends StatefulWidget {
  const NewsUpload_Page({Key? key}) : super(key: key);

  @override
  State<NewsUpload_Page> createState() => _NewsUpload_PageState();
}

String CatagoryName = "somthing";

class _NewsUpload_PageState extends State<NewsUpload_Page> {
  List Categorylist = [
    {'Catagoryname': "বিশেষ সংবাদ"},
    {'Catagoryname': "রাজনীতি"},
    {'Catagoryname': "বাংলাদেশ"},
    {'Catagoryname': "বিশ্ব"},
    {'Catagoryname': "চাকরি"},
    {'Catagoryname': "জীবনযাপন"},
    {'Catagoryname': "বিনোদন"},
    {'Catagoryname': "বাণিজ্য"},
    {'Catagoryname': "মতামত"},
  ];
  TextEditingController _TitleController = TextEditingController();
  TextEditingController _CategoryController = TextEditingController();
  TextEditingController _decController = TextEditingController();
  final _Formey=GlobalKey<FormState>();
  XFile? _courseImage;
  String? _imageUrl;

  chooseImageFromGC() async {
    ImagePicker _picker = ImagePicker();
    _courseImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  writeData() async {
    File _imageFile = File(_courseImage!.path);

    FirebaseStorage _storage = FirebaseStorage.instance;
    UploadTask _uploadTask =
    _storage.ref("{$CatagoryName}").child(_courseImage!.name).putFile(_imageFile);

    TaskSnapshot snapshot = await _uploadTask;

    _imageUrl = await snapshot.ref.getDownloadURL();

    CollectionReference _course =
    FirebaseFirestore.instance.collection("${CatagoryName}");

    _course.add({ // Stokes and Sons
    "Title":_TitleController.text,
    "dec"  :_decController.text,
    "category" :CatagoryName,
    'img': _imageUrl,
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey,
            height: 60,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){

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
                      child: Text(Categorylist[index]['Catagoryname'], style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ),
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          color: Colors.black,
          height: double.infinity,
          width: double.infinity,

          child: Form(
            key: _Formey,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(33),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )
                      ),
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          bottom: 5
                      ),
                      child: EditTextFieldPage(
                        validato: (value){
                          if(value!.isEmpty){
                            return "Wrong email";
                          }
                        },
                        maxLine: 2,
                        hintText: "Enter Title",
                        prefixicon: Container(
                            width: 60,
                            child: IconButton(onPressed: () {},
                                icon: Icon(
                                  Icons.account_circle_outlined, size: 33,
                                  color: Colors.black,))),
                        controlle: _TitleController,
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(33),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )
                      ),
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          bottom: 5
                      ),
                      child: EditTextFieldPage(
                        validato: (value){
                          if(value!.isEmpty){
                            return "Wrong email";
                          }
                        },
                        maxLine: 4,
                        hintText: "Enter Dec",
                        prefixicon: Container(
                            width: 60,
                            child: IconButton(onPressed: () {},
                                icon: Icon(
                                  Icons.sms, size: 33, color: Colors.black,))),
                        controlle: _decController,
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            bottom: 5
                        ),
                        color: Colors.black,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  height: double.infinity,
                                  color: Colors.amberAccent,
                                  child: Center(
                                      child: Container(
                                          child: _courseImage == null ? IconButton(icon: Icon(Icons.photo),
                                            onPressed: () {
                                              chooseImageFromGC();
                                            },
                                          ) : Image.file(File(_courseImage!.path),fit: BoxFit.fill,
                                          ))),
                                )),
                            SizedBox(width: 10,),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  height: double.infinity,
                                  color: Colors.green,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(33),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        )
                                    ),
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                        bottom: 5
                                    ),
                                    child: EditTextFieldPage(
                                      maxLine: 2,
                                      hintText: CatagoryName,
                                      prefixicon: Container(
                                          width: 60,
                                          child: IconButton(onPressed: () {},
                                              icon: Icon(
                                                Icons.account_circle_outlined,
                                                size: 33, color: Colors.black,))),
                                      controlle: _CategoryController,
                                    ),
                                  ),
                                )),
                          ],
                        )
                    )),
                Expanded(
                    flex: 4,
                    child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            bottom: 5
                        ),
                        color: Colors.redAccent,
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                            itemCount: Categorylist.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  setState((){
                                    CatagoryName=Categorylist[index]['Catagoryname'];

                                  });

                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: Colors.white,
                                  ),
                                  child: Text(Categorylist[index]['Catagoryname'],style: TextStyle(
                                    fontSize: 22,
                                  ),),
                                ),
                              );
                            })
                    )),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        if(_Formey.currentState!.validate()){
                          writeData();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => new1(),));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(11)
                        ),
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          bottom: 5,
                          left: 20,
                          right: 20,
                        ),
                        child: Text("ADD VALUE", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                    )),
              ],
            ),
          ),
        )
    );
  }
}

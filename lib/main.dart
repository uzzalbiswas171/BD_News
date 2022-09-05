import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stotext/AdminPage/NewsUploadPage/newsuploadpage.dart';
import 'package:stotext/HomePage/homepage.dart';
import 'package:stotext/NewPage/new1.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'W_news',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
    //  home: const HomePage(),
     home: const HomePage(),
   // home: const new1(),
    );
  }
}

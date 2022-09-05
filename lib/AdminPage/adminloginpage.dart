import 'package:flutter/material.dart';
import 'package:stotext/AdminHomePahe/adminhomePage.dart';
import 'package:stotext/HomePage/homepage.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admin Login"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage(),));
                    },
                child: Text("SignUP"),
                ),
              ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage(),));
                },
                child: Text("Login"),
              ),
            ),
          ),
        ],
      )

    );
  }
}

import 'package:flutter/material.dart';

class BottomAppBarPage extends StatelessWidget {
  const BottomAppBarPage({Key? key,required this.buttonname,required this.onPress}) : super(key: key);
   final VoidCallback onPress;
   final String buttonname;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

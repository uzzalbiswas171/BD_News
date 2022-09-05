import 'package:flutter/material.dart';

class EditTextFieldPage extends StatelessWidget {
  EditTextFieldPage({Key? key,required this.maxLine,required this.prefixicon,this.hintText,required this.controlle,this.validato}) : super(key: key);

  final TextEditingController? controlle;
  final FormFieldValidator<String>? validato;
  final String ? hintText;
  final Widget prefixicon;
  int? maxLine=1 ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      controller: controlle,
      validator: validato,
      decoration: InputDecoration(

        border: InputBorder.none,
      hintText: hintText,
        hintStyle: TextStyle(

          fontSize: 17,
          letterSpacing: 1,
        ),
        prefixIcon: prefixicon,
      ),
    );
  }
}

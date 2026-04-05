import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
   const TextFormWidget({super.key ,
      required this.controller ,
      required this.keyboardType ,
      required this.textInputAction ,
      required this.validator ,
      required this.hintText});

 final TextEditingController controller ;
 final TextInputType keyboardType ;
 final TextInputAction textInputAction ;
 final String ? Function(String?)? validator ;
 final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator:  validator,
      autovalidateMode: .onUserInteraction,
      cursorColor: Color(0xFFFFF1D4),
      cursorRadius: Radius.circular(16),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      style: TextStyle(
        color: Color(0xFFE2F4F6) ,
        fontSize: 16 ,
        fontWeight: .w400 ,),
      decoration: InputDecoration(
        hintText: hintText ,
        hintStyle: TextStyle(
          color: Color(0xFFE2F4F6) ,
          fontSize: 16 ,
          fontWeight: .w400 ,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
          borderSide: BorderSide(color:Color(0xFFFFF1D4) ),) ,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
          borderSide: BorderSide(color:Color(0xFFFFF1D4) ),) ,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
          borderSide: BorderSide(color:Color(0xFFFFF1D4) ),) ,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
          borderSide: BorderSide(color:Colors.red ),) ,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
          borderSide: BorderSide(color:Colors.red ),) ,
      ),

    );
  }
}

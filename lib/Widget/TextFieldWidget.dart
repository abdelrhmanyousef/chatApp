import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hinttext, required this.onchange});
  String? hinttext;
  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Field is Requierd";
        }
      },
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Colors.white,
          fontFamily: "Pacifico",
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

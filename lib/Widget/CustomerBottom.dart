import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.NameOFbutton, required this.ontap});
  String NameOFbutton;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 35,
        child: Center(
          child: Text(
            NameOFbutton,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

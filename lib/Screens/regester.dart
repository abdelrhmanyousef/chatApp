import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testweather/Screens/homePage.dart';
import 'package:testweather/Widget/TextFieldWidget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:testweather/Screens/chatscreen.dart';

import '../Widget/CustomerBottom.dart';
import '../Widget/showsnackbar.dart';

class RegesterPage extends StatefulWidget {
  @override
  static String registerId = "register";

  @override
  State<RegesterPage> createState() => _RegesterPageState();
}

class _RegesterPageState extends State<RegesterPage> {
  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  String? Email;

  String? pass;

  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 46, 62, 153),
        body: Form(
          key: formkey,
          child: Column(
            children: [
              Spacer(
                flex: 4,
              ),
              Image.asset(
                "assets/images/scholar.png",
              ),
              Text(
                "School Chat ",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Pacifico"),
              ),
              Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Pacifico",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                hinttext: " Email",
                onchange: (data) {
                  Email = data;
                },
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                hinttext: "Password",
                onchange: (data) {
                  pass = data;
                },
              ),
              CustomButton(
                ontap: () async {
                  if (formkey.currentState!.validate()) {
                    setState(() {
                      isloading = true;
                    });
                    try {
                      await registeruser();
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'weak-password') {
                        showsnackbar(context, "weak-password");
                      } else if (ex.code == 'email-already-in-use') {
                        showsnackbar(context, "email-already-in-use");
                      }
                    }
                    Navigator.pushNamed(
                      context,
                      chatpage.chatpageid,
                    );
                    setState(() {
                      isloading = false;
                    });
                  } else {}
                },
                NameOFbutton: "Register",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already have account",
                    style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(221, 202, 202, 0.992),
                      ),
                    ),
                  )
                ],
              ),
              Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registeruser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email!, password: pass!);
  }
}
// 
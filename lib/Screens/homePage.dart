import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:testweather/CubitChat/LoginCubit/login_cubit.dart';
import 'package:testweather/Screens/chatscreen.dart';
import 'package:testweather/Screens/regester.dart';
import 'package:testweather/Widget/TextFieldWidget.dart';

import '../Widget/CustomerBottom.dart';
import '../Widget/showsnackbar.dart';

class MyHomePage extends StatelessWidget {
  @override
  static String homeId = "home";

  String? email, pass;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadin) {
          isloading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, chatpage.chatpageid);
          isloading = false;
        } else if (state is LoginFailur) {
          showsnackbar(context, state.errormessage);
          isloading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
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
                      textAlign: TextAlign.left,
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                      email = data;
                    }),
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
                      BlocProvider.of<LoginCubit>(context)
                          .loginuser(email: email!, pass: pass!);
                    }
                  },
                  NameOFbutton: "Login",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have account",
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
                        Navigator.pushNamed(context, RegesterPage.registerId);
                      },
                      child: Text(
                        "Sing Up",
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
      ),
    );
  }

  Future<void> loginuser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: pass!);
  }
}

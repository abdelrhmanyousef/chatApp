import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testweather/Screens/chatscreen.dart';

import 'Screens/homePage.dart';
import 'Screens/regester.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(weatherApp());
}

class weatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Chat',
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        MyHomePage.homeId: (context) => MyHomePage(),
        RegesterPage.registerId: (context) => RegesterPage(),
        chatpage.chatpageid: (context) => chatpage(),
      },
      home: MyHomePage(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:testweather/Widget/chatBuble.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Models/message.dart';

class chatpage extends StatelessWidget {
  chatpage();
  static String chatpageid = "chatpageid";
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController contr = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy("created at", descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessagesModel> messageslist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageslist.add(MessagesModel.fromjson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color.fromARGB(255, 21, 93, 151),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/scholar.png", height: 20),
                      Text(
                        "Chat",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messageslist.length,
                        itemBuilder: (context, index) {
                          return messageslist[index].id == email
                              ? charbubel(
                                  message: messageslist[index],
                                )
                              : charbubelfr(
                                  message: messageslist[index],
                                );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: contr,
                        onSubmitted: (data) {
                          messages.add({
                            'messages': data,
                            'created at': DateTime.now(),
                            "id": email,
                          });
                          contr.clear();
                          _controller.animateTo(0,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceIn);
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.send),
                          hintText: "Send Message",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 16, 50, 78))),
                        ),
                      ),
                    )
                  ],
                ));
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

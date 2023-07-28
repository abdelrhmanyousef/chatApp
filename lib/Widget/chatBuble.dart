import 'package:flutter/material.dart';

import '../Models/message.dart';

class charbubel extends StatelessWidget {
  charbubel({required this.message});
  MessagesModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 16, right: 16),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(34),
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34)),
          color: const Color.fromARGB(255, 21, 93, 151),
        ),
        child: Text(
          message.messages,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class charbubelfr extends StatelessWidget {
  charbubelfr({required this.message});
  MessagesModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 16, right: 16),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34),
                topLeft: Radius.circular(34),
                topRight: Radius.circular(34)),
            color: Color.fromARGB(255, 82, 138, 94)),
        child: Text(
          message.messages,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

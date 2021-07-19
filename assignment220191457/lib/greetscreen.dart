import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class GreetingScreen extends StatefulWidget {
  // ignore: empty_constructor_bodies
  @override
  _GreetingScreenState createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: 320,
            child: Text(
              'CRUX FLUTTER SUMMER GROUP',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff2FC4B2),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
              width: 320,
              height: 70,
              child: Text(
                'Welcomes You',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 320,
              height: 70,
              child: Text(
                'ID NUMBER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              width: 320,
              height: 70,
              child: Text(
                'Have a great journey ahead !!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xff2FC4B2),
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                  style: TextButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric()),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('LOG OUT')),
            ),
          ]),
        ]),
      ),
    );
  }
}

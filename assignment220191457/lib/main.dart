import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'greetscreen.dart';
import 'regscreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      
      body: MyProject(),
      
    ));
  }
}



class MyProject extends StatefulWidget {
  @override
  MyProjectState createState() {
    return MyProjectState();
  }
}

class MyProjectState extends State<MyProject> {
  bool hide = true;
  String? id='';
  final fkey = GlobalKey<FormState>();
 

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: fkey,
      child: Center(
        
        child:
            Container(
              height: 700,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
              width: 320,
              child: Center(
                child: Text(
                  'CRUX FLUTTER SUMMER GROUP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff2FC4B2),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
          ),
          Column(
              children: [
                Padding(padding: EdgeInsets.all(25)),
                Column(
                  children: [
                    Padding(padding: EdgeInsets.all(16)),
                    SizedBox(
                      width: 320,
                      child: Text(
                        'ID Number',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                        width: 320,
                        
                        child: Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Please enter your BITS ID Number'),
                                   validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter valid ID Number';
              }
              
              return null;
            },onSaved: (value) => id=value,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                Column(
                  children: [
                    Padding(padding: EdgeInsets.all(16)),
                    SizedBox(
                      width: 320,
                      child: Text(
                        'Password',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                        width: 320,
                        
                        child: Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: TextFormField(
                                obscureText: hide,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Please enter your password',
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ],
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
                    final form= fkey.currentState;
                    if (fkey.currentState!.validate()) {
                      form!.save();
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GreetingScreen()),
                    ); 
                   }
                    
                  },
                  child: Text('LOG IN')),
          ),
          SizedBox(
              width: 300,
              child: Text(
                'Forgot Password ?',
                style: TextStyle(color: Color(0xff2FC4B2), fontSize: 15),
                textAlign: TextAlign.center,
              ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account ',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text('Register',
                      style: TextStyle(
                        color: Color(0xff2FC4B2),
                        fontSize: 15,
                      )),
                ),
              ],
          )
        ]),
            ),
      ),
    );
  }
}

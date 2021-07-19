import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'greetscreen.dart';
enum answer {yes,no}
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
String? id='';
  final fkey = GlobalKey<FormState>();
  String dropdownValue = '2020';
  bool _switch = false;
   answer? _character = answer.yes;
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      
      body: Center(
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          Center(
            child: Expanded(
              child: Container(
                alignment: Alignment.center,
                width: 350,
                height: 60,
                color: Color(0xff2FC4B2),
                child: Text(
                  'CRUX FLUTTER SUMMER GROUP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Column(
            children: [
              //Padding(padding: EdgeInsets.all(25)),
              Column(
                children: [
                  Padding(padding: EdgeInsets.all(12)),
                  Container(
                    width: 320,
                    child: Text(
                      'ID Number',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: 320,
                    height: 60,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Expanded(
                          child: TextFormField(
                            
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Please enter your BITS ID Number'),
                                 ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.all(12)),
                  Container(
                    width: 320,
                    child: Text(
                      'Password',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: 320,
                    height: 60,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Expanded(
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Please enter your password',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.all(12)),
                  Container(
                    width: 320,
                    child: Text(
                      'Batch',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: 320,
                    height: 60,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Expanded(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            underline: DropdownButtonHideUnderline(
                                child: Container()),
                            items: <String>[
                              '2020',
                              '2019',
                              '2018',
                              '2017'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Receive Regular Updates',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    textAlign: TextAlign.start),
                Switch(
                  value: _switch,
                  onChanged: (value) {
                    setState(() {
                      _switch = value;
                      print(_switch);
                    });
                  },
                  activeTrackColor: Colors.grey,
                  activeColor: Color(0xff2FC4B2),
                )
              ],
            ),
          ),
          Column(
            
            children: [
              SizedBox(
                width: 300,
                child: Text('Are you excited for this !!',
                      style: TextStyle(color: Colors.black, fontSize: 15,),
                      textAlign: TextAlign.start,
                      ),
              ),
              Container(
                
                
                child: Row(
                  
                  children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: const Text('Yes'),
                          leading: Radio<answer>(
                            value: answer.yes,
                            groupValue: _character,
                            onChanged: (answer? value) {
                                      setState(() {
                                        _character = value;
                                      });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          
                          title: const Text('No'),
                          leading: Radio<answer>(
                            value: answer.no,
                            groupValue: _character,
                            onChanged: (answer? value) {
                                      setState(() {
                                        _character = value;
                                      });
                            },
                          ),
                        ),
                      ),
                    ],
                ),
              )
                    
            ],
          ),
          Container(
            width: 320,
            height: 35,
            decoration: BoxDecoration(
                color: Color(0xff2FC4B2),
                borderRadius: BorderRadius.circular(10)),
            child: Expanded(
              child: TextButton(
                  style: TextButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric()),
                  onPressed: () {
                   
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GreetingScreen()),
                    ); 
                   
                    
                  },
                  child: Text('REGISTER')),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account ',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xff2FC4B2),
                      fontSize: 15,
                    ),
                  )),
            ],
          )
        ]),
      ),
    )
    );
    
  }
}

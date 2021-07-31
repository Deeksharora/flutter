
import 'package:assignment320191457/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'marks.dart';
import 'Navigation.dart';
//import 'HomeScreen.dart';

class TrackScreen extends StatefulWidget {
  
  @override
  _TrackScreenState createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final markscontroller = TextEditingController();
  String dropdownValue = '1';
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2FC4B2),
      ),
      
      
      body: SafeArea(
      
        child: Consumer<Marks>(
          builder: (context,marks,child){
            List <String> assignmentlist = ['1','2','3','4','5','6'];
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenSize.width * 0.9,
                            height: screenSize.height * 0.04,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Assignment Number',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.9,
                            height: screenSize.height * 0.07,
                            padding:
                                EdgeInsets.only(left: screenSize.width * 0.03),
                            color: Colors.grey[200],
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                icon: Icon(
                                  Icons.expand_more_sharp,
                                ),
                                dropdownColor: Colors.grey[200],
                                isExpanded: true,
                                value: dropdownValue,
                                onChanged: (String? newValue) {
                                  marks.assign(newValue);
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items:assignmentlist.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenSize.width * 0.90,
                            height: screenSize.width * 0.06,
                          ),
                        ]),
                          Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenSize.width * 0.9,
                            height: screenSize.height * 0.04,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Score',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.9,
                            height: screenSize.height * 0.07,
                            child: TextFormField(
                              obscureText: false,
                             controller: markscontroller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'Please enter your score',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                            width: screenSize.width * 0.90,
                            height: screenSize.width * 0.08,
                          ),
                 
                    Container(
                      width: screenSize.width * 0.45,
                      height: screenSize.height * 0.08,
                      child: Card(
                        color: Color(0xff2FC4B2),
                        child: TextButton(onPressed: () {
                          marks.assign();
                          marks.marksassign=double.parse( markscontroller.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Navigation()));
                          
                        }, child: Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 20),)),
                      ),
                    ),
                  
                  ],
                ), 
              ],
            )
          
          );},
        )
    ));
  
  }
}
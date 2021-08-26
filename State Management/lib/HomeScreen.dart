

import 'package:flutter/material.dart';
import 'TrackScreen.dart';
//import 'CourseModuleScreen.dart';
//import 'settingScreen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';
import 'marks.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {

  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
late String username;
late String idnumber;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username') ?? "");
      idnumber = (prefs.getString('idnumber') ?? "");
    });
    
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      
      
        
      body: SafeArea(
        
        child: Form(
          child : Consumer<Marks>(
            builder: (context,marks,child){
              double percent = (marks.count/6)*100;
          return Center(
            
            child: Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      width: screenSize.width*0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text('Hi ',style: TextStyle(fontSize: 30),),
                              
                              Container(
                                  child: Text(marks.name==1?username:idnumber
                                    ,style: TextStyle(fontSize: 30),
                                  ),
                                ),
                                  Text(' ! ',style: TextStyle(fontSize: 30),),
                  
                            ],
                          ),
                          
                          Container(
                            width: screenSize.width*0.85,
                            height: screenSize.height*0.25,
                            decoration: BoxDecoration(color:Colors.lightBlue[50],borderRadius: BorderRadius.all(Radius.circular(50))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Your Progress',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(marks.count.toString()+'/6'),
                                        Text('assignments done',style: TextStyle(fontSize: 15),),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: screenSize.width*0.25,
                                  height: screenSize.height*0.25,
                                  
                                  child: Center(child: Text(percent.toInt().toString()+'%',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25))),
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff2FC4B2)),
                                ),
                              ],
                            ),
                          ),
                          
                          Column(
                            children: [
                              Container(
                                width: screenSize.width*0.85,
                                alignment: Alignment.centerLeft,
                                child: Text('Your Score',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                              
                              Container(
                                width: screenSize.width*0.85,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: screenSize.width*0.2,
                                      height: screenSize.height*0.2,
                                      child: Center(child: Text(marks.marksassign.toString(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),)),
                                            decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xff2FC4B2)),
                                          ),
                                        Container(
                                  width: screenSize.width * 0.4,
                                height: screenSize.height * 0.08,
                                  child: Card(
                                    color: Color(0xff2FC4B2),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TrackScreen(
                                          ),
                                        ),
                                      );
                                      },
                                      child: Text(
                                        'TRACK',
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),  
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                
                    ),
                  ),
                ],
              ),
            ),
          );
            }),
      ),
      
      
    ));
  }
}

  
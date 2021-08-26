import 'package:flutter/material.dart';
//import 'TrackScreen.dart';
//import 'settingScreen.dart';


class CourseModuleScreen extends StatefulWidget {

  

  @override
  _CourseModuleScreenState createState() => _CourseModuleScreenState();
}
enum ExcitedChoice { yes, no }
class _CourseModuleScreenState extends State<CourseModuleScreen> {
  
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2FC4B2),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Container(
                  width: screenSize.width *0.85,
                  height: screenSize.height*0.8,
                  child: Expanded(
                    child: ListView(
                      children: [
                      Text('1. UI and Widgets',style: TextStyle(fontSize: 20),),
                      Text('2. Stateful Widgets',style: TextStyle(fontSize: 20)),
                      Text('3. State Management of App',style: TextStyle(fontSize: 20)),
                      Text('4. Connecting app to Server',style: TextStyle(fontSize: 20),),
                      Text('5. Connecting app to Firebase',style: TextStyle(fontSize: 20)),
                      Text('6. Capstone Project',style: TextStyle(fontSize: 20)),
                      ],
                      
                    ),
                  ),
                ),
              ),
             ]
            ),
        )
      )
    );
  }
}
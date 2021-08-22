
import 'package:flutter/material.dart';

class CourseModuleScreen extends StatefulWidget {
  const CourseModuleScreen({ Key? key }) : super(key: key);

  @override
  _CourseModuleScreenState createState() => _CourseModuleScreenState();
}

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
                  width: screenSize.width *0.70,
                 
                  child: Column(
                    
                    children: [
                    Container(child: Text('1. UI and Widgets',style: TextStyle(fontSize: 20,),),alignment: Alignment.centerLeft,),
                    Container(child: Text('2. Stateful Widgets',style: TextStyle(fontSize: 20)),alignment: Alignment.centerLeft,),
                    Container(child: Text('3. State Management of App',style: TextStyle(fontSize: 20)),alignment: Alignment.centerLeft,),
                    Container(child: Text('4. Connecting app to Firebase',style: TextStyle(fontSize: 20)),alignment: Alignment.centerLeft,),
                    Container(child: Text('5. Capstone Project',style: TextStyle(fontSize: 20)),alignment: Alignment.centerLeft,),
                    ],
                  
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
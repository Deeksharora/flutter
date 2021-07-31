import 'package:assignment320191457/HomeScreen.dart';
import 'package:flutter/material.dart';
//import 'TrackScreen.dart';
import 'CourseModuleScreen.dart';
import 'settingScreen.dart';


class Navigation extends StatefulWidget {
  

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index =0;
  final screens =[
   HomeScreen(),
   CourseModuleScreen(),
   SettingScreen()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        iconSize: 30,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (_index) => setState(() => index = _index),
      
        backgroundColor: Color(0xff2FC4B2),
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff2FC4B2)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Course',
            backgroundColor: Color(0xff2FC4B2)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color(0xff2FC4B2)
          ),

          

        ] ),
        body: screens[index] ,
    );
  }
}
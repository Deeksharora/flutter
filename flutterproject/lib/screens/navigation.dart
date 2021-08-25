import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginscreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';
import 'coursemodule.dart';
import 'settings.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({ Key? key }) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  int index =0;
  final screens =[
   HomeScreen(),
   CourseModuleScreen(),
   SettingScreen()

  ];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginScreen()));
      }
    });
  }
  

   getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser!.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
        this.isloggedin = true;
      });
    }
  }

    signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

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
       body: !isloggedin
          ? CircularProgressIndicator()
     : screens[index] ,
    );
  }
}
    
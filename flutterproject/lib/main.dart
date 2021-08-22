
import 'package:flutter/material.dart';
import 'screens/navigation.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

 class MyApp extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home:NavigationScreen()
    );
  }
 }
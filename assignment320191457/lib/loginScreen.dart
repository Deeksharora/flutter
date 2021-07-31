  
import 'package:assignment320191457/Navigation.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  
  final name = TextEditingController();
  final bitsIdController = TextEditingController();
  final passwordController = TextEditingController();
 


  @override
  Widget build(BuildContext context) {
    // MediaQuery for screenSizes
    var screenSize = MediaQuery.of(context).size;
    var name;
    var bitsIdController;
    var passwordController;
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: Container(
                alignment: Alignment.center,
                width: screenSize.width * 0.90,
                height: screenSize.height * 0.20,
                child: Text(
                  'CRUX FLUTTER SUMMER GROUP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff2FC4B2),
                    fontWeight: FontWeight.w800,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Container(
              width: screenSize.width * 0.90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: screenSize.height * 0.04,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Name',
                        ),
                      ),
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                            fillColor: Colors.grey[300],
                            filled: true,
                            hintText: 'Please enter your name'),
                            onChanged: (name) async {
                              final SharedPreferences logindata = await SharedPreferences.getInstance();
                               logindata.setString('username', name);
                            },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenSize.width * 0.90,
                    height: screenSize.width * 0.09,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: screenSize.height * 0.04,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ID Number',
                        ),
                      ),
                      TextFormField(
                        controller: bitsIdController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                            fillColor: Colors.grey[300],
                            filled: true,
                            hintText: 'Please enter your BITS ID Number'),
                            onChanged: (number) async {
                              final SharedPreferences logindata = await SharedPreferences.getInstance();
                               logindata.setString('idnumber', number);
                            },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenSize.width * 0.90,
                    height: screenSize.width * 0.09,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: screenSize.height * 0.04,
                        alignment: Alignment.centerLeft,
                        child: Text('Password'),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: 'Please enter your password',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: screenSize.width * 0.90,
                  height: screenSize.height * 0.08,
                  child: Card(
                    color: Color(0xff2FC4B2),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Navigation(
                                        ),
                                      ),
                                    );
                        },
                      child: Text(
                        'LOG IN',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: screenSize.width * 0.90,
                  height: screenSize.height * 0.04,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password ?'),
                    style:
                        TextButton.styleFrom(primary: Color(0xff2FC4B2)),
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
  
}

  

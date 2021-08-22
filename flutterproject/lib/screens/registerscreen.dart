import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterproject/database.dart';
import 'navigation.dart';
import 'loginscreen.dart';
enum answer {yes,no}
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

String? id='';
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = '2020';
  bool _switch = false;
   answer? _character = answer.yes;

 String _name='', _email='', _password='',_id='';

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
         Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavigationScreen()),
                      );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential result = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
            User? _user = result.user;
            
        await _auth.currentUser!.updateDisplayName(_name);
        await Database(uid: _user!.uid).updateuserdata(_name, _id, true ,[ 0, 0, 0, 0, 0]);
      } catch (e) {
        showError(e.toString());
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
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
                          'Name',
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
                                 validator: (input)
                              {
                                if(input!.isEmpty)
                                return 'Enter name';
                              },
                              onSaved: (input) => _name = input!,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Please enter your Name'),
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
                                 validator: (input)
                              {
                                if(input!.isEmpty)
                                return 'Enter valid ID Number';
                              },
                              onSaved: (input) => _id = input!,
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
                          'Email',
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
                                 validator: (input)
                              {
                                if(input!.isEmpty)
                                return 'Enter valid email';
                              },
                              onSaved: (input) => _email = input!,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Please Enter your Email'),
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
                                validator : (input)
                              {
                                if(input!.length<6)
                                return 'password should be atleast 6 characters long';
                              },
                              onSaved: (input) => _password = input!,
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
                      onPressed: signUp,
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
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
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
        ),
      ),
    )
    );
    
  }
}
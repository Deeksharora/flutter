import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterproject/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SettingScreen extends StatefulWidget {

  

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  
   @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      
      body: StreamBuilder(
         stream: FirebaseFirestore.instance.collection('course').doc(_auth.currentUser!.uid).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                if (snapshot.hasData)
                {
                  //return PageView.builder(
                //itemCount: snapshot.data!.docs.length,
                //itemBuilder: (BuildContext context, int index){
                  //var document = snapshot.data!.docs.elementAt(index);
                  bool _character=snapshot.data!['choice'];
                  return SafeArea(
        
         
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: screenSize.width *0.85,
                  child: Column(
                    children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Your Home Bio',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: RadioListTile<bool>(
                                    title: const Text('Name'),
                                    value: true,
                                    groupValue: _character,
                                    onChanged: (bool? value) async {
                                      
                                      await Database(uid:_auth.currentUser!.uid).updatechoice(true);
                                      setState(() {
                                        _character = snapshot.data!['choice'];
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<bool>(
                                    title: const Text('ID'),
                                    value: false,
                                    groupValue: _character,
                                    onChanged: (bool? value) async{
                                      
                                      await Database(uid:_auth.currentUser!.uid).updatechoice(false);
                                      setState(() {
                                        _character =snapshot.data!['choice'];
                                      });
                                      
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                       ),
                     ]
                   ),
                ),
                
               ]
              ),
          )
    );
                  



                //}
                //);
                }
                else {
              debugPrint('Loading...');
              return Center(
                child: Text('Loading...'),
              );
            }

              }
        ),
      
        
    );
  }
}


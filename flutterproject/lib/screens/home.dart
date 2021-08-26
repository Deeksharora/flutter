import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'trackscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final FirebaseAuth _auth = FirebaseAuth.instance;
   late User user; 
  bool ch=true;
  String name='';
  String id='';
    final CollectionReference data = FirebaseFirestore.instance.collection('course');


 getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
      });
    }
  }
   signOut() async {
    _auth.signOut();
  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,),
        
        body: StreamBuilder(
           stream: FirebaseFirestore.instance.collection('course').doc(_auth.currentUser!.uid).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                  if (snapshot.hasData)
                  {
                   // return PageView.builder(
                  
                  //itemBuilder: (BuildContext context, int index){
                   //var document = FirebaseFirestore.instance.collection('course').doc(_auth.currentUser!.uid);
                    //var document = snapshot.data!.docs.elementAt(index);
                    num percent = (snapshot.data!['count']/5)*100;
                    num score=snapshot.data!['a1']+snapshot.data!['a2']+snapshot.data!['a3']+snapshot.data!['a4']+snapshot.data!['a5']+5-snapshot.data!['count'];
                    //for(int i=0;i<5;i++)
                    //{
                     // if(snapshot.data!['Assignment'][i]!= -1)
                      // {
                      //  num currMarks=snapshot.data!['Assignment'][i];
                       // score=score+currMarks;
                     // }
                // }
                    return SafeArea(
          
          child: Center(
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
                        SizedBox(height: 0.05,),
                        Row(
                          children: [
                            Text('Hi ',style: TextStyle(fontSize: 30),),
                            SizedBox(width: 5,),
                            Container(
                              width: screenSize.width*0.75,
                                child: Text((snapshot.data!['choice'] == true ? snapshot.data!['name']: snapshot.data!['id'])+'!'
                                  ,style: TextStyle(fontSize: 20 ),
                                ),
                              ),
                                //Text(' ! ',style: TextStyle(fontSize: 30),),
                
                          ],
                        ),
                        SizedBox(height: 0.05,),
                        Container(
                          width: screenSize.width*0.85,
                          height: screenSize.height*0.30,
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
                                      Text(snapshot.data!['count'].toString()+'/5',style: TextStyle(fontSize: 25),),
                                      SizedBox(height: 5,),
                                      Text('Assignments done',style: TextStyle(fontSize: 15),),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: screenSize.width*0.28,
                                height: screenSize.height*0.28,
                                
                                child: Center(child: Text(percent.toInt().toString()+'%',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25))),
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff2FC4B2)),
                              ),
                            ],
                          ),
                        ),
                        
                        Column(
                          children: [
                            SizedBox(height: 10,),
                            Container(
                              width: screenSize.width*0.85,
                              alignment: Alignment.centerLeft,
                              child: Text('Your Score',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                            
                            Container(
                              width: screenSize.width*0.85,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: screenSize.width*0.2,
                                    height: screenSize.height*0.2,
                                    child: Center(child: Text(score.toString(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),)),
                                          decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xff2FC4B2)),
                                        ),
                                        SizedBox(width: screenSize.width*0.15,),
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
                            SizedBox(height: screenSize.height*0.01,),
                            TextButton(
                                    onPressed: () {
                                      signOut();
                                    },
                                    child: Text(
                                      'Sign Out',
                                      style: TextStyle(color: Color(0xff2FC4B2), fontSize: 20),
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
        
          
      ),
    );
  }
}


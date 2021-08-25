import 'package:flutter/material.dart';
import 'package:flutterproject/screens/navigation.dart';
import 'navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterproject/database.dart';


class TrackScreen extends StatefulWidget {
  
  @override
  _TrackScreenState createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
 double marks=0;
  int dropdownValue = 1;
  List <int> assignmentlist = [1,2,3,4,5];
   GlobalKey<FormState> _formkey = GlobalKey<FormState>();
   @override
  Widget build(BuildContext context) {
     
      FirebaseAuth _auth = FirebaseAuth.instance;
       
      
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      
      body: Form(
        key: _formkey,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('course').doc(_auth.currentUser!.uid).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                  if (snapshot.hasData)
                  {
                     // return PageView.builder(
                    //itemCount: snapshot.data!.docs.length,
                    //itemBuilder: (BuildContext context, int index){
                     //var document = snapshot.data!.docs.elementAt(index);
                   
                   
                   
        return SafeArea(
        
            
              
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenSize.width * 0.9,
                                height: screenSize.height * 0.04,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Assignment Number',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Container(
                                width: screenSize.width * 0.9,
                                height: screenSize.height * 0.07,
                                padding:
                                    EdgeInsets.only(left: screenSize.width * 0.03),
                                color: Colors.grey[200],
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    icon: Icon(
                                      Icons.expand_more_sharp,
                                    ),
                                    dropdownColor: Colors.grey[200],
                                    isExpanded: true,
                                    value: dropdownValue,
                                    onChanged: (int? newValue) {
                                      
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items:assignmentlist.map<DropdownMenuItem<int>>((int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.90,
                                height: screenSize.width * 0.06,
                              ),
                            ]),
                              Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenSize.width * 0.9,
                                height: screenSize.height * 0.04,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Score',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Container(
                                width: screenSize.width * 0.9,
                                height: screenSize.height * 0.07,
                                color: Colors.grey[200],
                                child: TextFormField(
                                
                                  validator : (input)
                                {
                                  if(input!.isEmpty)
                                  return 'Please enter the score';
                                  
                              
                                },
                                //onSaved: (input) => marks = input! as double,
                                  onChanged: (input) async {
                                    if(dropdownValue==1)
                                    {
                                      marks = input as double;
                                      if(snapshot.data!['a1']== -1)
                                      {
                                      await Database(uid:_auth.currentUser!.uid).updatecount(snapshot.data!['count']+1);
                                      }
                                      await Database(uid:_auth.currentUser!.uid).updatea1(marks);
                                    }
                                    else if(dropdownValue==2)
                                    {
                                      marks = input as double;
                                      if(snapshot.data!['a2']== -1)
                                      {
                                      await Database(uid:_auth.currentUser!.uid).updatecount(snapshot.data!['count']+1);
                                      }
                                      await Database(uid:_auth.currentUser!.uid).updatea2(marks);
                                    }
                                    else if(dropdownValue==3)
                                    {
                                      marks = input as double;
                                      if(snapshot.data!['a3']== -1)
                                      {
                                      await Database(uid:_auth.currentUser!.uid).updatecount(snapshot.data!['count']+1);
                                      }
                                      await Database(uid:_auth.currentUser!.uid).updatea3(marks);
                                    }
                                    else if(dropdownValue==4)
                                    {
                                      marks = input as double;
                                      if(snapshot.data!['a4']== -1)
                                      {
                                      await Database(uid:_auth.currentUser!.uid).updatecount(snapshot.data!['count']+1);
                                      }
                                      await Database(uid:_auth.currentUser!.uid).updatea4(marks);
                                    }
                                    else if(dropdownValue==5)
                                    {
                                      marks = input as double;
                                      if(snapshot.data!['a5']== -1)
                                      {
                                      await Database(uid:_auth.currentUser!.uid).updatecount(snapshot.data!['count']+1);
                                      }
                                      await Database(uid:_auth.currentUser!.uid).updatea5(marks);
                                    }
                                    //if(snapshot.data!['Assignment'][dropdownValue] == -1 )
                                    //{
                                     // List assign =snapshot.data!['Assignment'];
                                      //assign[dropdownValue-1]=input;
                                     //marks = input as double; 
                                      //await Database(uid:_auth.currentUser!.uid).updatesum(assign,marks);
                                   
                                    //}
                                    
                                  },
                                  
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    
                                    
                                    hintText: 'Please enter your score',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                                width: screenSize.width * 0.90,
                                height: screenSize.width * 0.08,
                              ),
                     
                        Container(
                          width: screenSize.width * 0.45,
                          height: screenSize.height * 0.08,
                          child: Card(
                            color: Color(0xff2FC4B2),
                            child: TextButton(onPressed: () {
                               if (_formkey.currentState!.validate()) {
        
                                     ScaffoldMessenger.of(context).showSnackBar(
                                     const SnackBar(content: Text('Processing Data')),
                               );
                              }
                             
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> NavigationScreen() ));
                              
                            }, child: Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 20),)),
                          ),
                        ),
                      
                      ],
                    ), 
                  ],
                )
              
              ),
            
          );
                    
      
      
      
                 // }
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


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterproject/database.dart';


class TrackScreen extends StatefulWidget {
  
  @override
  _TrackScreenState createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
 var currentFocus;
    
 unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

 double marks=0;
 final markscontroller = TextEditingController();
  int dropdownValue = 1;
  List <int> assignmentlist = [1,2,3,4,5];
   GlobalKey<FormState> _formkey = GlobalKey<FormState>();
   @override
  Widget build(BuildContext context) {
     
      FirebaseAuth _auth = FirebaseAuth.instance;
       
      
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: unfocus,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,),
        
        
        body: Form(
          key: _formkey,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('course').doc(_auth.currentUser!.uid).snapshots(),
              builder:
                  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                    if (snapshot.hasData)
                    {
                  
                     
          return SingleChildScrollView(
            child: SafeArea(
            
             
              child:  Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(height: screenSize.height*0.1,),
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
                                height: screenSize.height * 0.02,
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
                                child: TextFormField(
                                  obscureText: false,
                                 controller: markscontroller,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.grey[200],
                                    filled: true,
                                    hintText: 'Please enter your score',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                                width: screenSize.width * 0.90,
                                height: screenSize.height * 0.04,
                              ),
                     
                        Container(
                          width: screenSize.width * 0.45,
                          height: screenSize.height * 0.08,
                          child: Card(
                            color: Color(0xff2FC4B2),
                            child: TextButton(onPressed: () async {
                              if(dropdownValue==1)
                                        {
                                        
                                          if(snapshot.data!['a1']== -1)
                                          {
                                          await Database(uid:_auth.currentUser!.uid).updatecount(snapshot.data!['count']+1);
                                          }
                                          await Database(uid:_auth.currentUser!.uid).updatea1(double.parse(markscontroller.text));
                                        }
                                        else if(dropdownValue==2)
                                        {
                                          
                                          if(snapshot.data!['a2']== -1)
                                          {
                                          await Database(uid:_auth.currentUser!.uid).updatecount(snapshot.data!['count']+1);
                                          }
                                          await Database(uid:_auth.currentUser!.uid).updatea2(double.parse(markscontroller.text));
                                        }
                                        else if(dropdownValue==3)
                                        {
                                         
                                          if(snapshot.data!['a3']== -1)
                                          {
                                          await Database(uid:_auth.currentUser!.uid).updatecount(snapshot.data!['count']+1);
                                          }
                                          await Database(uid:_auth.currentUser!.uid).updatea3(double.parse(markscontroller.text));
                                        }
                                        else if(dropdownValue==4)
                                        {
                                         
                                          if(snapshot.data!['a4']== -1)
                                          {
                                          await Database(uid:_auth.currentUser!.uid).updatecount(snapshot.data!['count']+1);
                                          }
                                          await Database(uid:_auth.currentUser!.uid).updatea4(double.parse(markscontroller.text));
                                        }
                                        else if(dropdownValue==5)
                                        {
                                          
                                          if(snapshot.data!['a5']== -1)
                                          {
                                          await Database(uid:_auth.currentUser!.uid).updatecount(snapshot.data!['count']+1);
                                          }
                                          await Database(uid:_auth.currentUser!.uid).updatea5(double.parse(markscontroller.text));
                                        }
                              Navigator.pop(context);
                              
                            }, child: Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 20),)),
                          ),
                        ),
                      
                      ],
                    ), 
                  ],
                )
              
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
        
          
      ),
    );
  }
}

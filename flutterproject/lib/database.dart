import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database{


final String uid;
Database({required this.uid});
final CollectionReference data = FirebaseFirestore.instance.collection('course');
  FirebaseAuth _auth = FirebaseAuth.instance;

Future updateuserdata(String name,String id, bool choice,int count,num a1,num a2,num a3,num a4,num a5)
async {
  return await data.doc(uid).set({
  'name':name,
  'id':id,
  'choice': choice,
  'a1':a1,
  'a2':a2,
  'a3':a3,
  'a4':a4,
  'a5':a5,
  'count' : count
   });
   
} 

updatea1(num marks)async{
  Map<String,dynamic> demoData = {
       'a1': marks,
     };
     data.doc(_auth.currentUser!.uid).update(demoData);
}
updatea2(num marks)async{
  Map<String,dynamic> demoData = {
       'a2': marks,
     };
     data.doc(_auth.currentUser!.uid).update(demoData);
}
updatea3(num marks)async{
  Map<String,dynamic> demoData = {
       'a3': marks,
     };
     data.doc(_auth.currentUser!.uid).update(demoData);
}
updatea4(num marks)async{
  Map<String,dynamic> demoData = {
       'a4': marks,
     };
     data.doc(_auth.currentUser!.uid).update(demoData);
}
updatea5(num marks)async{
  Map<String,dynamic> demoData = {
       'a5': marks,
     };
     data.doc(_auth.currentUser!.uid).update(demoData);
}


  updatechoice(bool ch)async{
     Map<String,dynamic> demoData = {
       'choice': ch,
     };
     data.doc(_auth.currentUser!.uid).update(demoData);
   }
  

   updatecount(int cnt)async{
     Map<String,dynamic> demoData = {
       'count': cnt,
     };
     data.doc(_auth.currentUser!.uid).update(demoData);
   }

}
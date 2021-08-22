import 'package:cloud_firestore/cloud_firestore.dart';

class Database{


final String uid;
Database({required this.uid});
final CollectionReference data = FirebaseFirestore.instance.collection('course');

Future updateuserdata(String name,String id, bool choice,List<int> assignment)
async {
  return await data.doc(uid).set({
  'name':name,
  'id':id,
  'choice': choice,
  'Assignment':assignment
   });
} 


}
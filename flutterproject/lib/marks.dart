import 'package:flutter/material.dart';

import 'screens/settingsscreen.dart';

class Marks extends ChangeNotifier{
  int name=1;
double _marks =0;
 double get marks => _marks;

  set marksassign(double val){
    if(count!=prevcount)
    {
    _marks=_marks+val;
    prevcount=count;
    }
    notifyListeners();
  }
   double get marksassign  => _marks;
List <String> number = ['1','2','3','4','5','6'];
int count =0;int prevcount =0;
int listnumber=6;
Choice character= Choice.yes;

  void assign([String? newValue]){
    number.remove(newValue);
    listnumber=number.length;
    count=6-listnumber;
    notifyListeners();
  }
 
 void nameorid(int value)
 {
   name=value;
   if(value==1)
   character=Choice.yes;
   else
   character=Choice.no;
 }


}
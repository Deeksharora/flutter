import 'package:flutter/material.dart';
//import 'CourseModuleScreen.dart';
//import 'TrackScreen.dart';
//import 'HomeScreen.dart';
import 'marks.dart';
import 'package:provider/provider.dart';
class SettingScreen extends StatefulWidget {

  

  @override
  _SettingScreenState createState() => _SettingScreenState();
}
enum Choice { yes, no }
class _SettingScreenState extends State<SettingScreen> {
  Choice? _character;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2FC4B2),
      ),
     
      body: SafeArea(
        child: Consumer<Marks>(
          builder: (context,marks,child){

          return Center(
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
                                  child: RadioListTile<Choice>(
                                    title: const Text('Name'),
                                    value: Choice.yes,
                                    groupValue: _character,
                                    onChanged: (Choice? value) {
                                      int nameid= 1;
                                      marks.nameorid(nameid);
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<Choice>(
                                    dense: true,
                                    title: const Text('ID'),
                                    value: Choice.no,
                                    groupValue: _character,
                                    onChanged: (Choice? value) {
                                      int nameid= 0;
                                      marks.nameorid(nameid);
                                      setState(
                                        () {
                                          _character = value;
                                        },
                                      );
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
          );},
        )
    ));
  
  }
}
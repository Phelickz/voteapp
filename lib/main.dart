
import 'package:flutter/material.dart';
import 'package:voting_app/models/global.dart';
import 'package:voting_app/screens/home.dart';
import 'package:voting_app/screens/launch_screen.dart';
import 'package:voting_app/screens/result.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/state/vote.dart';

void main() => runApp(VoteApp());

class VoteApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => VoteState(),
        )
      ],
          child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => Scaffold(
            backgroundColor: darkGreyColor,
            body: LaunchScreen(),
          ),
          "/home": (context)=> SafeArea(
            child: Scaffold(
             
                appBar: AppBar(
                  leading: IconButton(icon: Icon(Icons.home, color: darkGreyColor,),
                  onPressed: (){Navigator.pushReplacementNamed(context, "/");},),
                  backgroundColor: redColor,
                  title: Text('VoteApp'),
                ),
                body: Home(),
            ),
          ),
          "/result": (context) => SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: Text('Result'),
                  leading: IconButton(icon: Icon(Icons.home), 
                  onPressed: (){Navigator.pushReplacementNamed(context, "/home");}, 
                  color: redColor,),
                ),
              body: ResultScreen(),
            ),
          )
        },
      ),
    );
  }
}
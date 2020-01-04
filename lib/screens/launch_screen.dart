import 'package:flutter/material.dart';
import 'package:voting_app/models/global.dart';



class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(100),
          child: Text('SPE eVoting',
            style: TextStyle(color: redColor,
              fontWeight: FontWeight.bold,
              fontSize: 40),),
        ),
        SizedBox(
          width: 100,
          height: 100,
        ),
        Container(
          width: 300,
          child: MaterialButton(
            hoverColor: Colors.lightGreen,
            hoverElevation: 5.0,
            height: 60,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
              padding: EdgeInsets.all(15.0),
              child: Text('Sign In',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              onPressed: (){Navigator.pushReplacementNamed(context, '/home');},
              color: redColor),
        ),
        SizedBox(
          width: 3,
          height: 3,
        ),
        Container(
          width: 300,
          child: MaterialButton(onPressed: (){Navigator.pushReplacementNamed(context, '/home');},
            height: 60,

            color: redColor,
            child: Text('Sign Up',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        )
      ],

    );
  }
}

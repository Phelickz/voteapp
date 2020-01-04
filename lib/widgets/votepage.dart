
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/state/vote.dart';
import 'package:voting_app/models/vote.dart';


class VoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Vote activeVote = Provider.of<VoteState>(context).activeVote;
//getting the vote contents from the Vote class created
    List<String> options = List<String>();

    for (Map<String, int> option in activeVote.options){
      option.forEach((title, value){
        options.add(title);
      });
    }

    return Column(
      children: <Widget>[
        Card(
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            child: Text(
              activeVote.voteTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 22, 
                color: Colors.teal)
            ),
          ),
        ),
        for(String options in options)
        Card(
          child: ListTile(
            leading: Icon(Icons.verified_user, color: Colors.teal,),
            title: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                options== null? '' : options,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
                  onTap: (){
                    Provider.of<VoteState>(context, listen: false).selectedOptionInActiveVote = options;
                  },
                ),
                  color: Provider.of<VoteState>(context, listen: false).selectedOptionInActiveVote == options ? Colors.lightGreen : Colors.white,
                )
        ],
    );
  }
}
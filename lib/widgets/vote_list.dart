import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/models/global.dart';
import 'package:voting_app/state/vote.dart';
import 'package:voting_app/models/vote.dart';


class VoteListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Function alternateColor = getAlternate(start: 0);

    String activeVoteId = Provider.of<VoteState>(context).activeVote?.voteId ?? "";

    return Consumer<VoteState>(
      builder: (context, voteState, child){
        return Column(
          children: <Widget>[
            for (Vote vote in voteState.voteList)
              Card(
                child: ListTile(
                  title: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      vote.voteTitle == null? '' : vote.voteTitle,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  selected: activeVoteId == vote.voteId ? true : false,
                  onTap: (){
                    Provider.of<VoteState>(context, listen: false).activeVote = vote;
                  },
                ),
                color: activeVoteId == vote.voteId ? Colors.teal[200] : alternateColor(),
              ),

            
          ],
        );
      }
    );
  }

  Function getAlternate({int start = 0}){
    int indexNum = start;

    Color getColor(){
      Color color = redColor;

      if (indexNum % 2==0){
        color = Colors.blue[200];
      }
      ++indexNum;
      return color;
    }
    return getColor;
  }
}
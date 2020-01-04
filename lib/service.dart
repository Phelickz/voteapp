import 'package:voting_app/models/vote.dart';
import 'package:uuid/uuid.dart';

List<Vote> getvoteList(){
  List<Vote> voteList = List<Vote>();
  

    voteList.add(
      Vote([{"Jame Biden": 70, "Nathaniel Rogers": 10, "Reynolds Schafer":30}], Uuid().v4(), "SPE President")
    );
  
    voteList.add(
      Vote([{"Hakeem Musa": 20, "Joseph Davids": 50, "Phillip Jacobs":50}], Uuid().v4(), "SPE Secretary General")
    );

    voteList.add(
      Vote([{"Jessica Jibunor": 30, "Brian Brown": 60, "Jameson Laravel":40}], Uuid().v4(), "SPE Financial Secretary")
    );

    return voteList;
}
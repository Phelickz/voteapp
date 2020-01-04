import 'package:flutter/material.dart';
import 'package:voting_app/models/vote.dart';

import 'package:voting_app/service.dart';


class VoteState with ChangeNotifier {
  List <Vote> _voteList = List<Vote>();
  Vote _activeVote;
  String _selectedOptionInActiveVote;

  void loadVoteList() async{
    _voteList = getvoteList();
    notifyListeners();
  }

  void clearState(){
    _activeVote = null;
    _selectedOptionInActiveVote = null;
  }

//defining getter functions
  List<Vote> get voteList => _voteList;
  Vote get activeVote => _activeVote;
  String get selectedOptionInActiveVote => _selectedOptionInActiveVote;  

//defining setter functions

  set activeVote(newValue){
    _activeVote = newValue;
    notifyListeners();
  }

  set selectedOptionInActiveVote(String newValue){
    _selectedOptionInActiveVote = newValue;
    notifyListeners();
  }
}


class Vote{
  String voteId;
  String voteTitle;
  List<Map<String, int>> options;

  //Vote({String voteId, String voteTitle, List<Map<String, int>> options});
  Vote(this.options, this.voteId, this.voteTitle);
}


class Voter {
  String uid;
  String voteId;

}
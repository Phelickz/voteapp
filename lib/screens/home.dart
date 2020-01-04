import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/state/vote.dart';
import 'package:voting_app/widgets/vote_list.dart';
import 'package:voting_app/widgets/votepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentStep = 0;
  
  @override
  void initState(){
    super.initState();
    //loading the votes
    Future.microtask(() {
      Provider.of<VoteState>(context, listen: false).clearState();
      Provider.of<VoteState>(context, listen: false).loadVoteList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Stepper(type: StepperType.horizontal,
              currentStep: _currentStep,
              steps:[
                getStep(
                  title: 'Choose',
                  child: VoteListWidget(),
                  isActive: true
                ),
                getStep(
                    title: 'Vote',
                    child: VoteWidget(),
                    isActive: _currentStep >= 1 ? true : false,
                ),
              ],
                onStepContinue: (){
                  if (_currentStep == 0){
                    if (step2Required()){
                      setState(() {
                        _currentStep = (_currentStep = 1) > 1 ? 1 : _currentStep;
                      });
                    }else{
                      showSnackBar(context, "Please select a Category");
                    }
                  }else if (_currentStep == 1){
                    if (step3Required()){
                      Navigator.pushReplacementNamed(context, '/result');
                    }else {
                      showSnackBar(context, "Please mark a vote to continue");
                    }
                  }
                },
                onStepCancel: (){
                  if (_currentStep <=0){
                    Provider.of<VoteState>(context, listen: false).activeVote = null;
                  }else if (_currentStep <= 1){
                    Provider.of<VoteState>(context, listen: false).selectedOptionInActiveVote = null;
                  }
                  setState(() {
                    _currentStep = (_currentStep - 1) < 0 ? 0 : _currentStep - 1;
                  });
                },
              )
          ),
        ],
      ),
    );
  }
//function to make sure that the user selects a vote before clicking the continue button

  bool step2Required(){
    if (Provider.of<VoteState>(context, listen: false).activeVote == null){
      return false;
    }
    return true;
  }

  bool step3Required(){
    if (Provider.of<VoteState>(context, listen: false).selectedOptionInActiveVote == null){
      return false;
    }
    return true;
  }

//message prompt to display usuing snackbar if the user doesnt select anything

  void showSnackBar(BuildContext context, String msg){
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(msg, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),));
  }

//function of the stepper i.e the progress bar
  Step getStep({String title, Widget child, bool isActive = false
  }){
    return Step(
        title: Text(title),
        content: child,
        isActive: isActive);
  }


}

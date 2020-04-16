import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizzapp/QuizzLogic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FlagScreen extends StatefulWidget {
  @override
  _FlagScreenState createState() => _FlagScreenState();
}

class _FlagScreenState extends State<FlagScreen> {
  
  QuizzLogic quizzLogic = new QuizzLogic();
  List<Icon> scoreIcon = [];
  int _numberOfGoodResponse = 0;
  Timer timer;
  int start = 5;
  
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (start < 1) {
          handleAnswer(answer: null);
        }else {
          start--;
        }
      });
      
    });
  }
  
  updateScore({bool win}) {
    setState(() {
      scoreIcon = List.from(scoreIcon);
      if (win) {
        scoreIcon.add(Icon(Icons.check, color: Colors.teal,));
        this._numberOfGoodResponse++;
      }else {
        scoreIcon.add(Icon(Icons.close, color: Colors.red,));
      }
      
    });
  }
  
  String textForClose(int percent) {
    if (percent == 100) {
      return "Un score parfait, sans faute... Bravo !";
    }else if (percent > 60) {
      return "Vous avez fait un bon score ${percent}% !";
    }else if(percent > 50) {
      return "Vous avez réussi à ${percent}% des questions !";
    }else if(percent == 50) {
      return "De justesse... La moyenne juste";
    }else if(percent < 50 && percent > 0) {
      return "Score trop faible de $percent%";
    }else if(percent == 0){
      return "T'es sérieux 0%, vraiment ?";
    }else {
      return "Vous avez réussi ${percent}% des questions !";
    }
  }
  
  handleAnswer({String answer}) {
  
    updateScore(
      win: answer == quizzLogic.getCorrectAnswer() ? true : false
    );
    
    if (!quizzLogic.isFinished()) {
      setState(() {
        start = 5;
        quizzLogic.nextQuestion();
      });
    }else {
      //Navigator.pop(context);
      
      timer.cancel();
      
      Alert(
        context: context,
        title: "Partie terminée !",
        desc: textForClose(quizzLogic.getPercent(numberWin: this._numberOfGoodResponse)),
        closeFunction: () {
          Navigator.pop(context);
        },
        buttons: [
          DialogButton(
            color: Colors.teal,
            child: Text(
              "Terminer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
            ),
            onPressed: () {
              //Pour quitter le pop-up
              Navigator.pop(context);
              //Pour quitter la partie
              Navigator.pop(context);
            },
            width: 120,
          )
        ]
      ).show();
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Text('$start',
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/flags/${quizzLogic.getFlagName()}"),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ButtonResponse(
                      title: quizzLogic.getAnswer1(),
                      onPressed: () {
                        handleAnswer(
                          answer: quizzLogic.getAnswer1()
                        );
                      },
                    ),
                    ButtonResponse(
                      title: quizzLogic.getAnswer2(),
                      onPressed: () {
                        handleAnswer(
                          answer: quizzLogic.getAnswer2()
                        );
                      },
                    ),
                    ButtonResponse(
                      title: quizzLogic.getAnswer3(),
                      onPressed: () {
                        handleAnswer(
                          answer: quizzLogic.getAnswer3()
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: ListView(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    scrollDirection: Axis.horizontal,
                    children: scoreIcon,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

}

class ButtonResponse extends StatelessWidget {
  final String title;
  final Function onPressed;


  ButtonResponse({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: RaisedButton(
        onPressed: this.onPressed,
        padding: EdgeInsets.all(18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.teal,
        textColor: Colors.white,
        child: Text(this.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

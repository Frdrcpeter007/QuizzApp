import 'package:flutter/material.dart';
import 'package:quizzapp/FlagScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("QuizzApp",
                style: TextStyle(
                  fontFamily: "Signatra",
                  fontSize: 120,
                  color: Colors.white
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              title: "Capitales",
              onPressed: () {
                //On pressed
                print("Tu as cliqué sur capitales");
              }
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              title: "Drapeaux",
              onPressed: () {
                //On pressed
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                  return new FlagScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  
  final String title;
  final Function onPressed;


  CustomButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: new RaisedButton(
        onPressed: this.onPressed,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(this.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
    );
  }
}

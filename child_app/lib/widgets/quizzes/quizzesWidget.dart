import 'package:child_app/widgets/quizzes/quizWidget.dart';
import 'package:flutter/material.dart';
import 'package:child_app/widgets/todos/missionsWidget.dart';

import '../../util/AppColors.dart';

class QuizzesWidget extends StatefulWidget {
  QuizzesWidget({Key? key, required this.title}) : super(key: key);
  static const String routeName = '/quizzes';

  final String title;

  @override
  _QuizzesWidgetState createState() => _QuizzesWidgetState();
}

class _QuizzesWidgetState extends State<QuizzesWidget> {
  bool solvingQuiz = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            foregroundColor: Colors.black,
            title: Text(widget.title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: AppColors.grey)),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Color(0xFFa1a1a1)),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Align(
                    child: Image.asset("assets/logo_grey.png",
                        height: 50, width: 50),
                  ))
            ],
            backgroundColor: Colors.white,
          ),
          body:
              !solvingQuiz ? Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff8F00FF), Color(0xff458FFF)
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ TextButton(

                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                          child: Text("Daily quiz", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: Colors.white
                      ),
                      )),
                      onPressed: () {
                        setState(() {
                          solvingQuiz = true;
                        });
                      },
                    ),Padding(child: Icon(Icons.arrow_forward_ios, color: Colors.white), padding: EdgeInsets.only(right: 20),)
                    ],
                    ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 40),
                      child:Align(
                    alignment: Alignment.centerLeft,
                      child: Text("Roadmap", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      color: AppColors.grey
                  ),
                  ))),
                ]
                  ) : QuizWidget()
    );
  }
}


/*ListView.builder(
shrinkWrap: true,
itemCount: quizzes.keys.length,
itemBuilder: (context, index) {
return Column(
children: [Text(quizzes.keys.elementAt(index)), ListView.builder(
shrinkWrap: true,
itemCount: quizzes.values.elementAt(index).length,
itemBuilder: (context, jndex) {
return ListTile(
title: Text(quizzes.values.elementAt(index)[jndex]),
);
})]);}
)*/

import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({Key? key, required this.callback}) : super(key: key);

  final callback;
  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

// Class: _QuizWidgetState
// Description: This class is the state of the quiz widget.
class _QuizWidgetState extends State<QuizWidget> {
  int questionNumber = 0;
  var answer = null;

  var quizzes = <String, List<String>>{
    "Koľko stojí chlieb?": ["10Ŧ", "1,35€", "0,99€", "0,63€"],
    "Koľko stojí chli?": ["10Ŧ", "1,35€", "0,99€", "0,63€"],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff8F00FF), Color(0xff458FFF)
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,

        ),
        margin: EdgeInsets.all(15),

        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 25, top: 50),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Question: " + (questionNumber + 1).toString(),
                      style: TextStyle(color: Colors.white)))),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(children: [
                  Padding(
                      padding: EdgeInsets.only(left: 25, bottom: 50),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(quizzes.keys.elementAt(questionNumber),
                            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                            ))),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          quizzes.values.elementAt(questionNumber).length,
                      itemBuilder: (context, jndex) {
                        return ListTile(
                          leading: Radio(
                            value: quizzes.values
                                .elementAt(questionNumber)
                                .elementAt(jndex),
                            groupValue: answer,
                            fillColor: MaterialStateProperty.all(Colors.white),
                            onChanged: (value) {
                              setState(() {
                                answer = value;
                              });
                            },
                          ),
                          title: Text(
                              quizzes.values.elementAt(questionNumber)[jndex]),
                          textColor: Colors.white,
                        );
                      })
                ]);
              }),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                           backgroundColor: Colors.white,
                          ),
                        child:
                        Container(
                          width: 50,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Next", style: TextStyle(color: Colors.black),), Icon(Icons.arrow_forward_ios, color: Colors.black, size: 12 )])),
                        onPressed: () {
                          setState(() {
                            if (answer != null){
                              answer = null;
                              if (questionNumber < quizzes.keys.length - 1) {
                                questionNumber++;
                              } else {
                                widget.callback();
                                questionNumber = 0;
                              }}
                          });
                        },
                      ))))
        ]));
  }
}

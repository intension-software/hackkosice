import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  QuizWidget({Key? key}) : super(key: key);
  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

// Class: _QuizWidgetState
// Description: This class is the state of the quiz widget.
class _QuizWidgetState extends State<QuizWidget> {
  int questionNumber = 0;

  var quizzes = <String, List<String>>{
    "Koľko stojí chlieb?": ["10Ŧ", "1,35€", "0,99€", "0,63€"],
    "Koľko stojí chli?": ["10Ŧ", "1,35€", "0,99€", "0,63€"],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,

        ),
        margin: EdgeInsets.all(15),

        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 16, top: 8),
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
                      padding: EdgeInsets.only(left: 16, top: 8),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(quizzes.keys.elementAt(questionNumber),
                            style: TextStyle(color: Colors.white, fontSize: 25),
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
                            groupValue: false,
                            fillColor: MaterialStateProperty.all(Colors.white),
                            onChanged: (value) {
                              setState(() {});
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
                           backgroundColor: Colors.white,),
                        child:
                        Container(
                          width: 50,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Next"), Icon(Icons.arrow_forward_ios, color: Colors.black, size: 12 )])),
                        onPressed: () {
                          setState(() {
                            questionNumber++;
                          });
                        },
                      ))))
        ]));
  }
}

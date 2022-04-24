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
  int _counter = 10;
  var quizzes = <String, List<String>>{
    "Koľko stojí chlieb?": ["10Ŧ", "1,35€", "0,99€", "0,63€"],
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            foregroundColor: Colors.black,
            bottom: TabBar(
              labelColor: AppColors.grey,
              indicatorColor: AppColors.grey,
              tabs: [
                Tab(text: 'Tasks'),
                Tab(text: 'History'),
              ],
            ),
            title: Text(widget.title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: AppColors.grey)),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFFa1a1a1)),
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
          body: TabBarView(
            children: [
              Scaffold(
                  body: Container(
                      margin: EdgeInsets.only(top: 10,right: 15,left: 15),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: quizzes.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff8F00FF),
                                      Color(0xff458FFF),
                                            ],
                                          ),
                                        ),
                                  child: 
                                  const Padding(padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Daily Quiz",
                                  ),
                                  ),
                                  // child: ListTile(
                                  //   title: Text(quizzes.keys.elementAt(index)),
                                  //   subtitle: Text(quizzes.values.elementAt(index).join(", ")),
                                  // ),
                                );
                              },
                            ),
                          ),
                        ],
                      ))),
              Center(
                child: Text('Tab 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

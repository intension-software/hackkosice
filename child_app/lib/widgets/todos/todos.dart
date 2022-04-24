import 'package:child_app/widgets/todos/missionsWidget.dart';
import 'package:flutter/material.dart';

import '../../util/AppColors.dart';

class Todos extends StatefulWidget {
  const Todos({Key? key, required this.title}) : super(key: key);
  static const String routeName = '/todos';

  final String title;
  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {

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
                  child:
                  Align(
                    child:
                    Image.asset("assets/logo_grey.png", height: 50, width: 50),
                  ))],
            backgroundColor: Colors.white,

          ),
          body: TabBarView(
            children: [
              MissionsWidget(),
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


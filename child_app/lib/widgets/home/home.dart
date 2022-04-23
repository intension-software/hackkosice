import 'package:child_app/widgets/content/content.dart';
import 'package:child_app/widgets/home/MoneyWidget.dart';
import 'package:flutter/material.dart';

import '../../util/AppColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  static const String routeName = '/home';

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                Tab(text: 'Money'),
                Tab(text: 'Piggy Bank'),
              ],
            ),
            title: Text(widget.title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: AppColors.grey)),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child:
                  Align(
                    child:
                    Icon(Icons.notifications_none_outlined, color: AppColors.grey),
                  ))
            ],
            backgroundColor: Colors.white,

          ),
          body: TabBarView(
            children: [
              MoneyWidget(),
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



class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.title,
      required this.routeName,
      required this.content})
      : super(key: key);

  final String title;
  final String routeName;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          width: double.infinity,
          child: Card(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              color: Colors.grey,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Divider(
                        height: 20,
                        color: Colors.transparent,
                      ),
                      content,
                    ],
                  ))),
        ));
  }
}

import 'package:parent_app/widgets/home/MissionsWidget.dart';
import 'package:parent_app/widgets/home/MoneyWidget.dart';
import 'package:parent_app/widgets/home/KidsWidget.dart';
import 'package:parent_app/widgets/home/userIcon.dart';
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
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            foregroundColor: Colors.black,
            bottom: const TabBar(
              labelColor: Colors.grey,
              indicatorColor: Colors.grey,
              tabs: [
                Tab(text: 'Accounts'),
                Tab(text: 'Kids'),
                Tab(text: 'Vaults'),
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
                  child: Align(
                    child: Icon(Icons.notifications_none_outlined,
                        color: AppColors.grey),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Align(
                    child: Image.asset("assets/logo_grey.png", height: 50, width: 50),
                  ))
            ],
            backgroundColor: Colors.white,
          ),
          body: TabBarView(
            children: [
              // MoneyWidget(),
              MoneyWidget(),
              KidsWidget(),
              const Center(
                child: Text('Tab 3'),
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

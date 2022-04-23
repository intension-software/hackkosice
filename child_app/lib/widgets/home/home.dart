import 'package:child_app/widgets/content/content.dart';
import 'package:flutter/material.dart';

import '../todos/todos.dart';
import '../balance/balance.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  static const String routeName = '/home';

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            HomeCard(
                title: "💰 Balance 💰",
                routeName: Todos.routeName,
                content: PiggyBank(
                  money: 100,
                  coins: 10,
                )),
            HomeCard(
                title: "✅ Missions ✅",
                routeName: Todos.routeName,
                content: ThumbnailContent(title: "Lóve")),
            HomeCard(
                title: "👨‍👩‍👧‍👦 Close people 👨‍👩‍👧‍👦",
                routeName: Todos.routeName,
                content: ThumbnailContent(title: "Lóve")),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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

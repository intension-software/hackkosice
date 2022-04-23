import 'package:flutter/material.dart';

import '../todos/todos.dart';

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
            HomeCard(title: "Todos", routeName: Todos.routeName),
            HomeCard(title: "Todos", routeName: Todos.routeName),
            HomeCard(title: "Todos", routeName: Todos.routeName),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.title, required this.routeName}) : super(key: key);

  final String title;
  final String routeName;

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
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    'nic',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              )
          )
      ),
    )
    );
  }
}

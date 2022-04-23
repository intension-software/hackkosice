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
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Todos.routeName);
                },
                child: Container(
                    width: double.infinity,
                    child: Card(
                        margin: EdgeInsets.all(20),
                        color: Colors.grey,
                        child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  'You have pushed the button this many times:',
                                ),
                                Text(
                                  '$_counter',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            )
                        )
                    )
                )
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';

class Todos extends StatefulWidget {
  const Todos({Key? key, required this.title}) : super(key: key);
  static const String routeName = '/todos';


  final String title;

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}
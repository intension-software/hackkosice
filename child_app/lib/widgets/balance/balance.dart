import 'package:flutter/material.dart';

class PiggyBank extends StatelessWidget {
  const PiggyBank({Key? key, required this.money, required this.coins}) : super(key: key);

  final int money;
  final int coins;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Text(
                "💰 Money: ",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                money.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                coins.toString(),
                style: Theme.of(context).textTheme.headline6,
              )
            ],
          ),
        ));
  }
}
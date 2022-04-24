import 'package:flutter/material.dart';

import '../../util/AppColors.dart';
import '../todos/todos.dart';

class MoneyWidget extends StatefulWidget {

  @override
  _MoneyWidgetState createState() => _MoneyWidgetState();
}

class _MoneyWidgetState extends State<MoneyWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            BalanceCard("\$1,000.00"),
          ],
        ),
      ),
    );
  }
}

Widget BalanceCard(String balance) {
  return Container(
    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
    width: double.infinity,
    child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
    color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
          child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(balance,
            style: TextStyle(
                color: AppColors.grey,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text("Dollars"),
          SizedBox(height: 15),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: Size.fromHeight(40)
                        ),
                        onPressed: () {},
                        child: Text(
                          "Request",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: Size.fromHeight(40)
                        ),
                        onPressed: () {},
                        child: Text(
                          "Transfer",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              ],
            )
        ],
      ))
  ));
}
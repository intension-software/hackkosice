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
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size.fromHeight(40),
                backgroundColor: AppColors.blue,
                ),

              child: Align(
                alignment: Alignment.centerLeft,
                  child:Text("Missions",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20))),
              onPressed: () {
                Navigator.pushNamed(context, Todos.routeName);
              },
            )),
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size.fromHeight(40),
                    backgroundColor: AppColors.blue,
                  ),

                  child: Align(
                      alignment: Alignment.centerLeft,
                      child:Text("Quiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20))),
                  onPressed: () {
                  },
                )),
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
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: AppColors.blue,
                minimumSize: Size.fromHeight(40),
            ),
            onPressed: () {},
            child: Text("Request Money",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),

        ],
      ))
  ));
}
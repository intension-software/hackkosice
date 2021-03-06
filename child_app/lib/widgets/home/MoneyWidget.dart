import 'package:child_app/widgets/quizzes/quizzesWidget.dart';
import 'package:flutter/material.dart';

import '../../util/AppColors.dart';
import '../Loading/Loading.dart';
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
            BalanceCard(LoadingState.user.balance.toString() + "\$"),
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size.fromHeight(40),
                    backgroundColor: AppColors.blue,
                  ),

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child:Text("Missions",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20))),
                        Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20)]),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new Todos(title: 'Missions',),
                      ),
                    );
                  },
                )),
            SizedBox(height: 10),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff8F00FF), Color(0xff458FFF)
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(


                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text("Quiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20))),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20)]),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new QuizzesWidget(title : 'Quizzes'),
                      ),
                    );
                  },
                ))),
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
          Row(children: [
            SizedBox(width: 5),
            Text(balance,
            style: TextStyle(
                color: AppColors.grey,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          )],
          ),
          SizedBox(height: 5),
          Text("Dollars"),
          SizedBox(height: 15),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
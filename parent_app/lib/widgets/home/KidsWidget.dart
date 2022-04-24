import 'package:flutter/material.dart';
import 'package:parent_app/widgets/home/userIcon.dart';
import 'package:parent_app/widgets/home/childUserIcon.dart';
import '../../util/AppColors.dart';
import '../todos/todos.dart';

class KidsWidget extends StatefulWidget {
  @override
  _KidsWidgetState createState() => _KidsWidgetState();
}

class _KidsWidgetState extends State<KidsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            BalanceCard("\$1,000.00", context),
            
          ],
        ),
      ),
    );
  }
}

Widget BalanceCard(String balance, BuildContext context) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Child",
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Parentson",
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              balance,
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                              child: childUserIcon(
                              ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: Size.fromHeight(40)
                              ),
                              onPressed: () {
                                Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => new Todos(title: 'Child Parentson',),
                                ),
                              );                                },
                              child: Text(
                                "Missions",
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
                                "View Child",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                    ],
                    ),
                  
                ],
              ))));
}

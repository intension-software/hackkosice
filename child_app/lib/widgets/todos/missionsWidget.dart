import 'package:flutter/material.dart';

import '../../util/AppColors.dart';

class MissionsWidget extends StatefulWidget {
  MissionsWidget({Key? key}) : super(key: key);

  @override
  _MissionsWidgetState createState() => _MissionsWidgetState();
}

class _MissionsWidgetState extends State<MissionsWidget> {
  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        margin: EdgeInsets.only(top: 10),
          child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _counter,
              itemBuilder: (context, index) {
                return Card (
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 20),
                    color: Color(0xFFf2f2f2),
                    shadowColor: Colors.transparent,
                    child: ListTile(
                      title: Text(
                        "Mission ${index + 1}",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.grey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',

                        ),
                      ),
                      subtitle: Text(
                        "Description of mission ${index + 1}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Text(
                        '\$5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 30,
                          color: AppColors.grey,
                        ),
                      ),
                    )
                );
              },
            ),
          ),
        ],
      ))
    );
  }
}
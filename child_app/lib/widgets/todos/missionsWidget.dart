import 'package:flutter/material.dart';

import '../../util/AppColors.dart';
import '../Loading/Loading.dart';

class MissionsWidget extends StatefulWidget {
  MissionsWidget({Key? key}) : super(key: key);

  @override
  _MissionsWidgetState createState() => _MissionsWidgetState();
}

class _MissionsWidgetState extends State<MissionsWidget> {
  int _counter = 10;
  var missions = LoadingState.missions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: missions.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (direction) async {
                            setState(() {
                              //missions.remove(missions.elementAt(index));
                            });
                            return false;
                          },
                          background: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: AppColors.completeColor,
                            child: Align(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.check_rounded,
                                  color: Colors.white54,
                                  size: 35,
                                ),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          key: Key(index.toString()),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 0, left: 20, right: 20),
                              color: missions.elementAt(index).state == "created" ? Color(0xFFf2f2f2) :
                              missions.elementAt(index).state == "completed" ? (AppColors.completeColor) :
                              Color(0xFFf2f2f2),
                              shadowColor: Colors.transparent,
                              child: missions.elementAt(index)
                                          .state ==
                                      "created"
                                  ? (ListTile(
                                      title: Text(
                                        missions.elementAt(index).text,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      subtitle: Text(
                                        missions
                                            .elementAt(index)
                                            .due,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      trailing: Text(
                                        missions
                                            .elementAt(index).reward.values.elementAt(1).toString() + "\$",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter',
                                          fontSize: 30,
                                          color: AppColors.grey,
                                        ),
                                      ),
                                    ))
                                  : missions
                                              .elementAt(index)
                                              .state ==
                                          "completed"
                                      ? ListTile(
                                          title: Text(
                                            missions.elementAt(index).text,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Inter',
                                            ),
                                          ),
                                          trailing: Text(
                                            "Claim",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Inter',
                                              fontSize: 30,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        )
                                      : null ));
                    },
                  ),
                ),
              ],
            )));
  }
}

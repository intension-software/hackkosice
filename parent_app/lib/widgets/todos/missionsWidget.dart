import 'package:flutter/material.dart';
import '../Loading/Loading.dart';
import 'package:http/http.dart' as http;
import '../../util/AppColors.dart';

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
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Dismissible(
                        direction: DismissDirection.horizontal,
                        confirmDismiss: (direction) async {
                          setState(() {
                            missions.removeAt(index);
                          });
                          return false;
                        },
                        background: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: AppColors.deleteColor,
                          margin: EdgeInsets.zero,
                          child: Align(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.close,
                                color: Colors.white54,
                                size: 35,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        secondaryBackground: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: AppColors.completeColor,
                          margin: EdgeInsets.zero,
                          child: Align(
                            child: Padding(
                              padding: EdgeInsets.only(right: 20),
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
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[
                                AppColors.deleteColor,
                                AppColors.completeColor
                              ], // red to yellow
                              tileMode: TileMode.repeated,
                            ),
                          ),
                          child: Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: missions.elementAt(index).state ==
                                      "created"
                                  ? Color(0xFFf2f2f2)
                                  : missions.elementAt(index).state ==
                                          "completed"
                                      ? (AppColors.completeColor)
                                      : Color(0xFFf2f2f2),
                              shadowColor: Colors.transparent,
                              child: missions.elementAt(index).state ==
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
                                        missions.elementAt(index).due,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      trailing: Text(
                                        missions
                                            .elementAt(index)
                                            .reward
                                            .values
                                            .elementAt(1)
                                            .toString() +
                                        "\$",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter',
                                          fontSize: 30,
                                          color: AppColors.grey,
                                        ),
                                      ),
                                    ))
                                  : missions.elementAt(index).state ==
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
                                      : null),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

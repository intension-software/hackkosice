import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../util/AppColors.dart';
import '../Loading/Loading.dart';

class MissionsWidget extends StatefulWidget {
  MissionsWidget({Key? key}) : super(key: key);

  @override
  _MissionsWidgetState createState() => _MissionsWidgetState();
}

class _MissionsWidgetState extends State<MissionsWidget> {
  var missions = LoadingState.missions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (direction) async {
                              await http.patch(
                                Uri.parse(LoadingState.apiUrl +
                                    "/mission/${missions[index].id}/complete"),
                              );
                              print("Mission ${missions[index].id} completed");
                              setState(() {
                                missions.removeAt(index);
                              });
                              return false;
                            },
                            background: Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: AppColors.completeColor,
                              child: Align(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
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
                                    AppColors.completeColor,
                                    AppColors.completeColor
                                  ], // red to yellow
                                  tileMode: TileMode.repeated,
                                ),
                              ),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  margin: EdgeInsets.zero,
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
                                              "approved"
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
            )));
  }
}

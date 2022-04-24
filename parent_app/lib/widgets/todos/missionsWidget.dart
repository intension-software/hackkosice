import 'package:flutter/material.dart';

import '../../util/AppColors.dart';

class MissionsWidget extends StatefulWidget {
  MissionsWidget({Key? key}) : super(key: key);

  @override
  _MissionsWidgetState createState() => _MissionsWidgetState();
}

class _MissionsWidgetState extends State<MissionsWidget> {
  int _counter = 10;
  var missions = <String, List<String>>{
    "Получить призы": ["Получить призы", "\$10", "created"],
    "Получить при": ["Получить призы", "\$2", "created"],
    "Получить sпризы": ["Получить призы", "\$10", "created"],
    "a призы": ["Получить призы", "\$10", "created"],
    "Получитьs призы": ["Получить призы", "\$10", "created"],
    "Получитaь призы": ["Получить призы", "\$10", "created"],
  };

  double padValue = 0.0;
  void _animatePadding() {
    // setState(() {
    //   padValue = value;
    // });
    setState(() {
      padValue = 50;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        padValue = 0;
      });
      Future.delayed(const Duration(milliseconds: 600), () {
        setState(() {
          padValue = 50;
        });
        Future.delayed(const Duration(milliseconds: 600), () {
          setState(() {
            padValue = 0;
          });
        });
      });
    });
  }

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
                        onUpdate: (update) {
                          _animatePadding();
                        },
                        confirmDismiss: (direction) async {
                          setState(() {
                            missions.remove(missions.keys.elementAt(index));
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
                          child: AnimatedPadding(
                            padding: EdgeInsets.only(right: padValue),
                            duration: const Duration(milliseconds: 5arko00),
                            curve: Curves.easeOut,
                            child: Card(
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: missions.values
                                            .elementAt(index)
                                            .elementAt(2) ==
                                        "created"
                                    ? Color(0xFFf2f2f2)
                                    : missions.values
                                                .elementAt(index)
                                                .elementAt(2) ==
                                            "completed"
                                        ? (AppColors.completeColor)
                                        : Color(0xFFf2f2f2),
                                shadowColor: Colors.transparent,
                                child: missions.values
                                            .elementAt(index)
                                            .elementAt(2) ==
                                        "created"
                                    ? (ListTile(
                                        title: Text(
                                          missions.keys.elementAt(index),
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: AppColors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                        subtitle: Text(
                                          missions.values
                                              .elementAt(index)
                                              .elementAt(0),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        trailing: Text(
                                          missions.values
                                              .elementAt(index)
                                              .elementAt(1),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter',
                                            fontSize: 30,
                                            color: AppColors.grey,
                                          ),
                                        ),
                                      ))
                                    : missions.values
                                                .elementAt(index)
                                                .elementAt(2) ==
                                            "completed"
                                        ? ListTile(
                                            title: Text(
                                              missions.values
                                                  .elementAt(index)
                                                  .elementAt(1),
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // body: Container(
      //   margin: const EdgeInsets.only(top: 10),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       ClipRRect(
      //         borderRadius: BorderRadius.circular(16),
      //         child: Dismissible(
      //           key: UniqueKey(),
      //           background: Container(
      //             decoration: ShapeDecoration(
      //               color: Colors.red,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16)),
      //             ),
      //           ),
      //           secondaryBackground: Container(
      //             decoration: ShapeDecoration(
      //               color: Colors.green,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16)),
      //             ),
      //           ),
      //           child: Container(
      //             decoration: const BoxDecoration(
      //               gradient: LinearGradient(
      //                 begin: Alignment.centerLeft,
      //                 end: Alignment.centerRight,
      //                 colors: <Color>[
      //                   Colors.red,
      //                   Colors.green
      //                 ], // red to yellow
      //                 tileMode: TileMode.repeated,
      //               ),
      //             ),
      //             child: Card(
      //               margin: EdgeInsets.zero,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16)),
      //               child: const Padding(
      //                 padding: EdgeInsets.all(8),
      //                 child: Text('Hello, world!'),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

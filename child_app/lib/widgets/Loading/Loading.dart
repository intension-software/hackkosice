import 'dart:convert';

import 'package:child_app/widgets/Loading/user.dart';
import 'package:child_app/widgets/home/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Missions.dart';

class Loading extends StatefulWidget {

  static final String routeName = '/loading';

  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  static const String apiUrl = "http://10.0.4.164:5000/api/v1";
  bool finished = false;
  static late User user;
  static late List<Mission> missions = [];

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    finished ? Navigator.of(context).pushReplacementNamed(HomePage.routeName): null;
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void getUser () async {
    var response = await http.get(Uri.parse(apiUrl + '/user/1'));

    user = User.fromJson(jsonDecode(response.body));
    response = await http.get(Uri.parse(apiUrl + '/missions'));
    jsonDecode(response.body).forEach((mission) => missions.add(Mission.fromJson(mission)));
    Navigator.pushReplacementNamed(context, HomePage.routeName);
}
}
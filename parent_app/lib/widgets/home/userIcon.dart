import 'package:parent_app/util/AppColors.dart';
import 'package:flutter/material.dart';

Widget userIcon() {
  return Container(
    child: Card(
      color: AppColors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: 
        const Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.person_outlined,
            color: Colors.white,
          size: 28,
        ),
    ),
  ),
  );
}

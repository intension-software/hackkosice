import 'package:flutter/material.dart';

class ThumbnailContent extends StatelessWidget {
  const ThumbnailContent({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Text(
                title.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ));
  }
}
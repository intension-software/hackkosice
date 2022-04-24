import 'package:child_app/widgets/Loading/Loading.dart';
import 'package:flutter/material.dart';

import '../../util/AppColors.dart';

class PiggyBank extends StatefulWidget {
  @override
  _PiggyBankState createState() => _PiggyBankState();
}


class _PiggyBankState extends State<PiggyBank> {
  int money = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(

          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
                child: Text(
              money.toString() + '\$',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            )),
            Container(
              margin: EdgeInsets.all(20),
                child:Image.asset('assets/piggy_bank_page.png')),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    minimumSize: Size.fromHeight(40),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Add 5\$',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if(LoadingState.user.balance >= 5) {
                        LoadingState.user.balance -= 5;
                        money += 5;}
                      else {
                        final snackBar = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('You don\'t have enough money'),
                          action: SnackBarAction(
                            label: 'Okay',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  },
                ),
              ),
            ),

        ],
      ),
    ),
    );
  }
}

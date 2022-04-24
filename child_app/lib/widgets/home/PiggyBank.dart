import 'package:child_app/widgets/Loading/Loading.dart';
import 'package:flutter/material.dart';

import '../../util/AppColors.dart';

class PiggyBank extends StatefulWidget {
  @override
  _PiggyBankState createState() => _PiggyBankState();
}


class _PiggyBankState extends State<PiggyBank> with TickerProviderStateMixin{
  int money = 10;
  late AnimationController controller;
  final now = DateTime.now();
  var moneyDeposit = DateTime.parse('2022-04-23 15:18:04Z');
  late final Duration moneyWithdraw;


  @override
  void initState() {
    moneyWithdraw = moneyDeposit.add(const Duration(hours: 25)).difference(now);
    controller = AnimationController(
      vsync: this,
      duration: const Duration(hours: 25),
      value: (25-moneyWithdraw.inHours)/25,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFeef4f4),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(
                      "Balance:",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),Text(
              money.toString() + '\$',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            )])),
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
            Container(child: Text(moneyWithdraw.inHours.toString() + ' hours left', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.grey),)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: LinearProgressIndicator(
              minHeight: 30,
              backgroundColor: Color(0x783DAED1),
              color: AppColors.blue,
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),))
        ],
      ),)
    ),
    );
  }
}

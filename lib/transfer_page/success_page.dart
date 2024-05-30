import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_page.dart';

class SuccessPage extends StatelessWidget {
  String sendTo;
  String bankAcoount;
  String amount;
  SuccessPage(
      {Key? key,
      required this.sendTo,
      required this.bankAcoount,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 120,
            ),
             Text(
              'Money Transferred Successfully',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor),
            ),
            SizedBox(height: 10),
            const Text(
              'Transfer to:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(sendTo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  color: primaryColor),),
            const SizedBox(height: 10),
            Text(bankAcoount,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  color: primaryColor),),
            const SizedBox(height: 10),
            Text('\$ $amount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  color: primaryColor),),

            SizedBox(height: 20),

            ElevatedButton(
              key: const Key('done_key'),
                onPressed: () {
                  // Navigator.pop(context);
                  // Navigator.pop(context); or
                  //Navigator.of(context).popUntil((route) => route.isFirst); or
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(user: User(email: '', password: '', bankAccount: '', yourName: ''),)), (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: primaryColor,
                  minimumSize: const Size(60,32),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25),
                  child: Text('Done'),
                )),
          ],
        ),
      ),
    );
  }
}

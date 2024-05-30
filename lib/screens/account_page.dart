import 'package:bank_ui_design/screens/payment_page.dart';
import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/material.dart';

import '../custom_class/drawer_custom.dart';
import '../transaction/transaction.dart';
import 'Exchange_page.dart';
import 'card_page.dart';

class AccountPage extends StatelessWidget {
  final User user;
  AccountPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35.0),
              child: Text('ACCOUNT'),
            ),
          ],
        ),
        backgroundColor: primaryColor,

      ),
      drawer: DrawerCustom(user: user),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 13.0, left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  Icons.account_circle_sharp,
                  color: accentColor,
                  size: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 1.5),
                child: Text(
                  'YOUR NAME',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(top: 5, left: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  key: const Key('your_name_key'),
                  decoration: const InputDecoration(
                    hintText: 'Your Name',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 1.5),
                child: Text(
                  'BANK ACCOUNT',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(top: 5, left: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  key: const Key('bank_account_key'),
                  decoration: const InputDecoration(
                    hintText: 'Bank Account',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 1.5),
                child: Text(
                  'EMAIL',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(top: 5, left: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  key: const Key('email_key'),
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 1.5),
                child: Text(
                  'PASSWORD',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(top: 5, left: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  key: const Key('password_key'),
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (newValue) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 1.5),
                child: Text(
                  'PHONE NUMBER',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(top: 5, left: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  key: const Key('phone_number_key'),
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (newValue) {
                    // Handle the phone number input
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 1.5),
                child: Text(
                  'YOUR ADDRESS',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  key: const Key('address_key'),
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.0),
                      child: Text('*'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        'Nunc faucibus a pellentesque sit porttitor eget dolor morbi non',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: primaryColor,
                        minimumSize: const Size(60, 32),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10),
                        child: Text('SAVE CHANGES'),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

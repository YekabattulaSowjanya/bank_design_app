import 'package:bank_ui_design/transfer_page/success_page.dart';
import 'package:flutter/material.dart';
import '../custom_class/drawer_custom.dart';
import '../sqlite/user_model.dart';

class Transfer extends StatelessWidget {
  final User user;
  Transfer({Key? key, required this.user}) : super(key: key);

  final sendToController = TextEditingController();
  final amountController = TextEditingController();
  final bankAccountController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
              child: Text('TRANSFER'),
            ),
          ],
        ),
        backgroundColor: primaryColor,
      ),
      drawer: DrawerCustom(user: user),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 13.0, left: 50, right: 50),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  padding: const EdgeInsets.only(top: 10.0, bottom: 3),
                  child: Text(
                    'SEND TO',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                TextFormField(
                  key: const Key('send_to_key'),
                  controller: sendToController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(6.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.3, color: Colors.black),
                        borderRadius: BorderRadius.circular(6.0)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.3, color: Colors.red),
                        borderRadius: BorderRadius.circular(6.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.3, color: Colors.black),
                        borderRadius: BorderRadius.circular(6.0)),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    hintText: 'Send to',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter send to';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 3),
                  child: Text(
                    'BANK ACCOUNT or UPI',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                TextFormField(
                  key: const Key('bank_account_key'),
                  controller: bankAccountController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(6.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.3, color: Colors.black),
                        borderRadius: BorderRadius.circular(6.0)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.3, color: Colors.red),
                        borderRadius: BorderRadius.circular(6.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.3, color: Colors.black),
                        borderRadius: BorderRadius.circular(6.0)),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    hintText: 'Bank Account or UPI',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter bank account or upi';
                    }
                    return null; // Input is valid
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 3),
                  child: Text(
                    'Amount',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                TextFormField(
                  key: const Key('amount_key'),
                  controller: amountController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(6.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.3, color: Colors.black),
                        borderRadius: BorderRadius.circular(6.0)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.3, color: Colors.red),
                        borderRadius: BorderRadius.circular(6.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.3, color: Colors.black),
                        borderRadius: BorderRadius.circular(6.0)),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    hintText: 'Amount',
                    alignLabelWithHint: true,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Amount';
                    }
                    return null; // Input is valid
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: ElevatedButton(
                        key: const Key('submit_key'),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            String sendTo = sendToController.text;
                            String bankAcoount = bankAccountController.text;
                            String amount = amountController.text;

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SuccessPage(
                                    sendTo: sendTo,
                                    bankAcoount: bankAcoount,
                                    amount: amount,
                                  ),
                                ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: primaryColor,
                          minimumSize: const Size(60, 32),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10),
                          child: Text('SUBMIT'),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

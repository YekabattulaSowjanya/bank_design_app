import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:bank_ui_design/transaction/transaction_progress.dart';
import 'package:flutter/material.dart';
import '../consts/user_details_const.dart';
import '../custom_class/drawer_custom.dart';


class TransactionPage extends StatefulWidget {
  final User user;
  const TransactionPage({Key? key, required this.user}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int fromBankAccount = 0;
  String fromBankAccountError = '';

  int amount = 0;
  String amountError = '';
  var selectedAccount;
  final formKey = GlobalKey<FormState>();


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
              padding: EdgeInsets.only(left: 0.0),
              child: Text('TRANSACTION'),
            ),
          ],
        ),
        backgroundColor: primaryColor,

      ),
      drawer: DrawerCustom(user: widget.user),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor, width: 10),
                    ),
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, top: 20),
                    child: Column(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(2.5, 1.0, 1.0),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 40,
                            color: primaryColor,
                          ),
                        ),
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(-2.5, 1.0, 1.0),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 40,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 15, bottom: 8),
                child: Text(
                  'From Bank Account',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  key: const Key('from_bank_account_key'),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (newValue) {
                    setState(() {
                      fromBankAccount = int.tryParse(newValue) ?? 0;
                      fromBankAccountError = '';
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 8),
                child: Text(
                  'To Bank Account',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Form(
                key: formKey,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButtonFormField<String>(
                    key: const Key('select_key'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Select some role';
                      } else {
                        return null;
                      }
                    },
                    icon: const Icon(Icons.keyboard_arrow_down),
                    value: null,
                    hint: const Text('SELECT'),
                    onChanged: (newValue) {
                      setState(() {
                        selectedAccount = newValue;
                      });
                    },
                    items: bankAccounts.map((account) {
                      return DropdownMenuItem<String>(
                        value: account,
                        child: Text(account),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 8),
                child: Text(
                  'Amount',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButtonFormField<String>(
                        key: const Key('dollar_key'),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        value: null,
                        hint: Text(
                          '\$',
                          style: TextStyle(color: primaryColor, fontSize: 19.5),
                        ),
                        onChanged: (newValue) {},
                        items: currencies.map((currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        key: const Key('amount_key'),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Amount',
                        ),
                        style: const TextStyle(fontSize: 20),
                        onChanged: (newValue) {
                          setState(() {
                            amount = int.tryParse(newValue) ?? 0;
                            amountError = '';
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 8),
                child: Text(
                  'Messages',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  key: const Key('message_key'),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      key: const Key('send_key'),
                        onPressed: () {
                          // final isValid = formKey.currentState!.validate();
                          // if (!isValid) return;
                          if (fromBankAccount == 0 && amount == 0 ) {
                            setState(() {
                              fromBankAccountError =
                                  'from bank account is empty';
                              amountError = 'amount is empty';
                            });
                          } else {
                            if (fromBankAccount == 0) {
                              fromBankAccountError =
                                  'from bank account is empty';
                            }
                            if (amount == 0) {
                              amountError = 'amount is empty';
                            }
                            if (fromBankAccount == 0 || amount == 0) {
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TransactionProgress(
                                          user: widget.user)));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: primaryColor,
                          minimumSize: const Size(60, 31),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 27, right: 27),
                          child: Text(
                            'SEND',
                            style: TextStyle(),
                          ),
                        )),
                    const Text(
                      'or',
                      style: TextStyle(fontSize: 20),
                    ),
                    OutlinedButton(
                      key: const Key('cancel_key'),
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(60, 31),
                          side: BorderSide(color: primaryColor, width: 2)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 17, right: 17),
                        child: Text(
                          'CANCEL',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (fromBankAccountError.isNotEmpty || amountError.isNotEmpty)
                Center(
                  child: Column(
                    children: [
                      if (fromBankAccountError.isNotEmpty)
                        Text(
                          fromBankAccountError,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      if (amountError.isNotEmpty)
                        Text(
                          amountError,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 20),
                        )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

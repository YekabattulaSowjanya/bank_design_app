import 'package:bank_ui_design/screens/card_page.dart';
import 'package:flutter/material.dart';
import '../screens/Exchange_page.dart';
import '../screens/account_page.dart';
import '../screens/payment_page.dart';
import '../sqlite/user_model.dart';
import '../transaction/transaction.dart';

class DrawerCustom extends StatelessWidget {

  final User user;
  const DrawerCustom({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: accentColor,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  user.yourName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  user.email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            key: const Key('account_key1'),
            leading: const Icon(Icons.account_circle),
            title: const Text('Account'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountPage(user: user,)));
            },
          ),
          ListTile(
            key: const Key('add_card_key'),
            leading: const Icon(Icons.credit_card),
            title: const Text('Add Card'),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddCard(user: user,)));
            },
          ),
          ListTile(
            key: const Key('transaction_key'),
            leading: const Icon(Icons.list),
            title: const Text('Transaction'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionHomePage(user: user,)));
            },
          ),
          ListTile(
            key: const Key('payments_key'),
            leading: const Icon(Icons.payment),
            title: const Text('Payments'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentPage(user: user,)));
            },
          ),
          ListTile(
            key: const Key('exchange_key'),
            leading: const Icon(Icons.payment),
            title: const Text('Exchange'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExchangePage(user: user,)));
            },
          ),
        ],
      ),
    );
  }
}

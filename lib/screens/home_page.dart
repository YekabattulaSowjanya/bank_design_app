import 'package:bank_ui_design/screens/card_page.dart';
import 'package:bank_ui_design/screens/payment_page.dart';
import 'package:bank_ui_design/transfer_page/transfer.dart';
import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/material.dart';
import '../consts/user_details_const.dart';
import '../custom_class/drawer_custom.dart';
import '../transaction/transaction.dart';
import 'Exchange_page.dart';
import 'account_page.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 40, bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey,
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [primaryColor, const  Color(0xff0f4c82),],//3577b8, Color(0xff2b659e)
                ),
                //color: primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                     // const Icon(Icons.settings, color: Colors.white)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 52,
                      child: Icon(
                        Icons.person,
                        color: accentColor,
                        size: 88,
                      )),
                    Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                    child: Text(widget.user.yourName,
                      //'YOUR NAME',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                   Text(widget.user.email,
                    //'your-email@gmail.com',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 15),
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 10, left: 60, right: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.grey,
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BALANCE',
                          style: TextStyle(color: accentColor, fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 2),
                          child: Text('\$4,180.20',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Transfer(user: widget.user,),));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(60,32),
                              elevation: 5,
                              backgroundColor: primaryColor, // Background color
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 5),
                              child: Text('TRANSFER'),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 26.0,bottom: 5
              ),
              child: Text(
                'LATEST TRANSACTIONS',
                style: TextStyle(
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 15, right: 20, top: 10),
                shrinkWrap: true,
                //itemCount: transactions.length,
                itemCount: _isExpanded ? transactions.length : 4,
                itemExtent: 61,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 21,
                      backgroundColor: primaryColor,
                    ),
                    title: Text(transactions[index].title),
                    subtitle: Text(transactions[index].subTitle),
                    trailing: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(transactions[index].amount),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 25),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    _isExpanded ? "less <<" : "more >>",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerCustom(user: widget.user),
    );
  }
}

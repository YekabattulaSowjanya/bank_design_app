import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/user_details_const.dart';
import '../custom_class/drawer_custom.dart';
import '../transaction/transaction.dart';
import 'Exchange_page.dart';
import 'account_page.dart';

class PaymentPage extends StatefulWidget {
  final User user;
  PaymentPage({Key? key, required this.user}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 30),
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
                colors: [primaryColor, const  Color(0xff0f4c82)],//3577b8, Color(0xff2b659e)
              ),
              //color: primaryColor,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(
                    width: 27,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 35,
                  ),
                  const Text(
                    'PAYMENT',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 95,
                  ),
                  //const Icon(Icons.settings, color: Colors.white)
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 28.0, right: 13),
                    child: Icon(
                      Icons.account_circle_sharp,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          'BALANCE',
                          style: TextStyle(color: accentColor, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text('\$4,180.20',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              )
            ])),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
          child: SizedBox(
            height: 470,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: _isExpanded ? icons.length : 9,
              //itemCount: icons.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: colors[index % colors.length],
                      child: Icon(
                        icons[index],
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.5),
                      child: Text(
                        iconNames[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                _isExpanded ? "less>>" : "more>>",
                style: TextStyle(color: accentColor, fontSize: 18),
              ),
            ),
          ),
        )
      ])),
      drawer: DrawerCustom(user: widget.user),
    );
  }
}

import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:bank_ui_design/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import '../custom_class/drawer_custom.dart';


class TransactionHomePage extends StatelessWidget {

  final User user;
  TransactionHomePage({Key? key, required this.user}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                    width: 0,
                  ),
                  const Text(
                    'TRANSACTION',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 89,
                  ),
                  //const Icon(Icons.settings, color: Colors.white)
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Text(
                  'SCAN THIS QR CODE',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left: 80, right: 70, top: 20, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.grey,
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.qr_code_2_outlined,
                    size: 200,
                  )),
               Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: Text(
                  user.yourName,
                  style: const TextStyle(color: Colors.white, fontSize: 23),
                ),
              ),
               Text(
                user.email,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ])),
        const Padding(
          padding: EdgeInsets.only(top: 30.0, bottom: 10),
          child: Text('Try BARCODE', style: TextStyle(fontSize: 20)),
        ),
        const Image(
          image: AssetImage(
            'assets/barcode_image.jpg',
          ),
          width: 180,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 38.0, bottom: 10),
          child: Text(
            'Can\'t scan the QR Code?',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Try ', style: TextStyle(fontSize: 18)),
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: accentColor,
                      width: 1.5, // Underline thickness
                    ))
                ),
              padding: const EdgeInsets.only(bottom: 2),
              child: GestureDetector(
                key: const Key('bank_account_key'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  TransactionPage(user: user)));
                },
                child: Text(
                  'Bank Account',
                  style: TextStyle(color: accentColor, fontSize: 18,decorationThickness: 3,),
                ),
              ),
            )
          ],
        )
      ])),
      drawer: DrawerCustom(user: user),
    );
  }
}

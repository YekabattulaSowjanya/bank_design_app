import 'package:bank_ui_design/screens/payment_page.dart';
import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/material.dart';
import '../consts/user_details_const.dart';
import '../custom_class/drawer_custom.dart';
import '../transaction/transaction.dart';
import 'Exchange_page.dart';
import 'account_page.dart';

class AddCard extends StatelessWidget {
  final User user;
  const AddCard({Key? key, required this.user}) : super(key: key);

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
              child: Text('ADD CARD'),
            ),
          ],
        ),
        backgroundColor: primaryColor,
      ),
      drawer: DrawerCustom(user: user),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Image(
                  image: AssetImage(
                    'assets/card_image.jpg',
                  ),
                  height: 150,
                  width: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 2),
                child: Text(
                  'YOUR NAME',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(top: 5, left: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'NAME',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.name,
                  onChanged: (newValue) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 2),
                child: Text(
                  'CART NUMBER',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(top: 5, left: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'INSERT YOUR CARD NUMBER',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (newValue) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 2),
                child: Text(
                  'EXPIRED DATE',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonFormField<String>(
                        isDense: true,
                        itemHeight: 48,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        value: null,
                        hint: const Text(
                          'Day',
                        ),
                        onChanged: (newValue) {
                          // Handle the selection
                        },
                        items: List.generate(31, (index) {
                          return DropdownMenuItem<String>(
                            value: (index + 1).toString(),
                            child: Center(
                                child: Text(
                              (index + 1).toString(),
                            )),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonFormField<String>(
                        alignment: AlignmentDirectional.topStart,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        isDense: true,
                        value: null,
                        hint: const Text(
                          'Month',
                        ),
                        onChanged: (newValue) {
                          // Handle the selection
                        },
                        items: listitems.map((itemone) {
                          return DropdownMenuItem(
                              alignment: AlignmentDirectional.topEnd,
                              value: itemone,
                              child: Text(itemone));
                        }).toList(),
                        itemHeight: 48,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        value: null,
                        isDense: true,
                        hint: const Text(
                          'Year',
                        ),
                        onChanged: (newValue) {
                          // Handle the selection
                        },
                        items: List.generate(10, (index) {
                          int currentYear = DateTime.now().year;
                          return DropdownMenuItem<String>(
                            value: (currentYear + index).toString(),
                            child: Text((currentYear + index).toString()),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 2),
                child: Text(
                  'PASSWORD',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(top: 5, left: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'PASSWORD',
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (newValue) {
                    // Handle the phone number input
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 2),
                child: Text(
                  'PHONE NUMBER',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 46,
                      width: 80,
                      padding: const EdgeInsets.only(left: 8, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        value: "+91",
                        onChanged: (newValue) {},
                        items: ["+91", "+1", "+44"].map((countryCode) {
                          return DropdownMenuItem<String>(
                            value: countryCode,
                            child: Text(countryCode),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),///16
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 9.0),
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
                          style: TextStyle(color: Colors.black54)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 9.0),
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
                          style: TextStyle(color: Colors.black54)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: primaryColor,
                        minimumSize: const Size(60, 32),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18),
                        child: Text('LINK CARD'),
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

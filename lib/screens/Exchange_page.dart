import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/material.dart';
import '../consts/user_details_const.dart';
import '../custom_class/drawer_custom.dart';

class ExchangePage extends StatelessWidget {
  final User user;
  const ExchangePage({Key? key, required this.user}) : super(key: key);

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
              child: Text('EXCHANGE'),
            ),
          ],
        ),
        backgroundColor: primaryColor,

      ),
      drawer: DrawerCustom(user: user),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 45,
                      child: const Icon(
                        Icons.attach_money,
                        size: 60,
                        color: Colors.white,
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 36.0, top: 15, right: 36),
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
                  CircleAvatar(
                      backgroundColor: accentColor,
                      radius: 45,
                      child: const Text(
                        '£',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40.0, right: 40, top: 20, bottom: 20),
              child: Row(
                children: [
                Expanded(
                  flex: 1,
                 child: Container(
                    width: 65,
                     height: 51,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonFormField<String>(
                      key: const Key('drop_down_key'),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: null,
                      hint: Text(
                        '\$',
                        style: TextStyle(
                            color: accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      onChanged: (newValue) {},
                      items: currencies.map((currency) {
                        return DropdownMenuItem<String>(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                    ),
                  )),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all( width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        key: const Key('amount_text_field_key'),
                        style: TextStyle(color: primaryColor, fontSize: 22,fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Amount',
                          hintStyle: TextStyle(color: primaryColor)
                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text('CONVERT TO',style: TextStyle(color: primaryColor),),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40.0, right: 40, top: 18, bottom: 15),
              child: Row(
                children: [
                Expanded(
                flex: 1,
                child: Container(
                    width: 65,
                    height: 51,
                    decoration: BoxDecoration(
                      border: Border.all( width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonFormField<String>(
                      key: const Key('europe_key'),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: null,
                      hint: Text('£',
                          style: TextStyle(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 26)),
                      onChanged: (newValue) {},
                      items: currencies.map((currency) {
                        return DropdownMenuItem<String>(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                    ),
                  )),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all( width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        key: const Key('amount_key'),
                        style: TextStyle(color: primaryColor, fontSize: 22,fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Amount',
                          hintStyle: TextStyle(color: primaryColor)
                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, bottom: 20),
              child: SizedBox(
                height: 300,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 2.2,
                  ),
                  itemCount: keyboardKeys.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: primaryColor,
                          width: 2,
                        ),
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Center(
                        child: TextButton(
                          key: const Key('text_button_key'),
                          onPressed: () {
                            String key = keyboardKeys[index];
                            // Handle the key press
                          },
                          child: Text(
                            keyboardKeys[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

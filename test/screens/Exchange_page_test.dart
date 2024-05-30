import 'package:bank_ui_design/screens/Exchange_page.dart';
import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("test exchange page to find appbar row", (widgetTester) async{

    var exchangePage = ExchangePage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: exchangePage));

    expect(find.byType(SingleChildScrollView), findsOneWidget);
    var rowWidget = find.byType(Row);
    expect(rowWidget, findsWidgets);

    var exchangeText = find.text('EXCHANGE');
    expect(exchangeText, findsWidgets);

    var backIcon = find.byIcon(Icons.arrow_back_ios);
    expect(backIcon, findsOneWidget);
    await widgetTester.tap(backIcon);
    await widgetTester.pumpAndSettle();
  });

  testWidgets("test exchange page to find icon ", (widgetTester) async{

    var exchangePage = ExchangePage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: exchangePage));

    var rowWidget = find.byType(SingleChildScrollView);
    expect(rowWidget, findsWidgets);

    var backIcon = find.byIcon(Icons.attach_money);
    expect(backIcon, findsOneWidget);

    var forwardIcon = find.byIcon(Icons.arrow_forward);
    expect(forwardIcon, findsNWidgets(2));

    var europeText = find.text('£');
    expect(europeText, findsWidgets);
  });

  testWidgets("test exchange page to find row dropdown ", (widgetTester) async{

    var exchangePage = ExchangePage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: exchangePage));

    var dropDownKey = find.byKey(const Key('drop_down_key'));
    expect(dropDownKey, findsOneWidget);
    await widgetTester.tap(dropDownKey);
    await widgetTester.pumpAndSettle();

    var amountKey = find.byKey(const Key('amount_text_field_key'));
    expect(amountKey, findsOneWidget);

    var convertText = find.text("CONVERT TO");
    expect(convertText, findsOneWidget);

  });

  testWidgets("test exchange page to find 2nd row dropdown ", (widgetTester) async{

    var exchangePage = ExchangePage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: exchangePage));

    var dropDown1Key = find.byKey(const Key('europe_key'));
    expect(dropDown1Key, findsOneWidget);

    var amount1Key = find.byKey(const Key('amount_key'));
    expect(amount1Key, findsOneWidget);

  });

  testWidgets("test exchange page to find gridview widget", (widgetTester) async{

    var exchangePage = ExchangePage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);
    await widgetTester.pumpWidget(MaterialApp(home: exchangePage));

    var keyboardKey = find.byKey(const Key('text_button_key'));
    expect(keyboardKey, findsWidgets);
    final dropdownItem = find.text('1').last;
    await widgetTester.tap(dropdownItem);

  });



}
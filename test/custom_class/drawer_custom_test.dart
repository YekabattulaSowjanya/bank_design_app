
import 'package:bank_ui_design/custom_class/drawer_custom.dart';
import 'package:bank_ui_design/screens/Exchange_page.dart';
import 'package:bank_ui_design/screens/account_page.dart';
import 'package:bank_ui_design/screens/payment_page.dart';
import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:bank_ui_design/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets('test drawer custom to find accountPage navigation', (widgetTester) async{

    var drawerCustom = DrawerCustom(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ));

    await widgetTester.pumpWidget(MaterialApp(home: drawerCustom));

    var accountKey= find.byKey(const Key('account_key1'));
    expect(accountKey, findsOneWidget);

    await widgetTester.tap(accountKey);
    await widgetTester.pumpAndSettle();

    expect(find.byType(AccountPage), findsOneWidget);
  });

  // testWidgets('test drawer custom to find addcardPage navigation', (widgetTester) async{
  //
  //   var drawerCustom = DrawerCustom(user: User(
  //       email: 'spw@gmail.com',
  //       password: 'Sowj@123',
  //       bankAccount: 'credit',
  //       yourName: 'sowjanya'
  //   ));
  //
  //   await widgetTester.pumpWidget(MaterialApp(home: drawerCustom));
  //
  //   var addCardKey= find.byKey(const Key('add_card_key'));
  //   expect(addCardKey, findsOneWidget);
  //
  //   await widgetTester.tap(addCardKey);
  //   await widgetTester.pumpAndSettle();
  //
  //   expect(find.byType(AddCard), findsOneWidget);
  // });

  testWidgets('test drawer custom to find transaction page navigation', (widgetTester) async{

    var drawerCustom = DrawerCustom(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ));

    await widgetTester.pumpWidget(MaterialApp(home: drawerCustom));

    var transactionKey= find.byKey(const Key('transaction_key'));
    expect(transactionKey, findsOneWidget);

    await widgetTester.tap(transactionKey);
    await widgetTester.pumpAndSettle();

    expect(find.byType(TransactionHomePage), findsOneWidget);
  });

  testWidgets('test drawer custom to find payments page page navigation', (widgetTester) async{

    var drawerCustom = DrawerCustom(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ));

    await widgetTester.pumpWidget(MaterialApp(home: drawerCustom));

    var paymentsKey= find.byKey(const Key('payments_key'));
    expect(paymentsKey, findsOneWidget);

    await widgetTester.tap(paymentsKey);
    await widgetTester.pumpAndSettle();

    expect(find.byType(PaymentPage), findsOneWidget);
  });

  testWidgets('test drawer custom to find exchange page page navigation', (widgetTester) async{

    var drawerCustom = DrawerCustom(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ));

    await widgetTester.pumpWidget(MaterialApp(home: drawerCustom));

    var exchangeKey= find.byKey(const Key('exchange_key'));
    expect(exchangeKey, findsOneWidget);

    await widgetTester.tap(exchangeKey);
    await widgetTester.pumpAndSettle();

    expect(find.byType(ExchangePage), findsOneWidget);
  });


}
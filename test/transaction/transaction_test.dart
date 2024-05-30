import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:bank_ui_design/transaction/transaction.dart';
import 'package:bank_ui_design/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  
  testWidgets("test TransactionHomePage to find drawer", (widgetTester) async{
    
    var transactionHomePage = TransactionHomePage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);
    
    await widgetTester.pumpWidget(MaterialApp(home: transactionHomePage));

    var menuIcon = find.byIcon(Icons.menu);
    expect(menuIcon, findsOneWidget);
    await widgetTester.tap(menuIcon);
    await widgetTester.pumpAndSettle();//95.0, 64.0

    expect(find.text('TRANSACTION'), findsOneWidget);

    var backArrow =find.byIcon(Icons.arrow_back_ios);
    await widgetTester.tap(backArrow);
    await widgetTester.pumpAndSettle();
  });

  testWidgets("test TransactionHomePage to find scanner", (widgetTester) async{

    var transactionHomePage = TransactionHomePage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionHomePage));

    expect(find.byIcon(Icons.qr_code_2_outlined), findsOneWidget);

    expect(find.text('Try BARCODE'), findsOneWidget);

    expect(find.text('Can\'t scan the QR Code?'), findsOneWidget);

    expect(find.text('Try '), findsOneWidget);
  });

  testWidgets("test TransactionHomePage to find bank account button", (widgetTester) async{

    var transactionHomePage = TransactionHomePage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionHomePage));

    var bankAccountButton= find.text('Bank Account');
    expect(bankAccountButton, findsOneWidget);
    var bankKey = find.byKey(const Key('bank_account_key'));
    await widgetTester.dragUntilVisible(bankKey, find.byType(SingleChildScrollView), Offset(436.0, 644.0));
    await widgetTester.tap(bankKey); ///436.0, 644.0
    await widgetTester.pumpAndSettle();
    expect(find.byType(TransactionPage), findsOneWidget);

    var backArrow =find.byIcon(Icons.arrow_back_ios);
    await widgetTester.tap(backArrow);
    await widgetTester.pumpAndSettle();
  });

  testWidgets("test TransactionHomePage to find navigation to next page", (widgetTester) async{

    var transactionHomePage = TransactionHomePage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionHomePage));

    var backArrow =find.byIcon(Icons.arrow_back_ios);
    await widgetTester.tap(backArrow);
    await widgetTester.pump();
  });
}
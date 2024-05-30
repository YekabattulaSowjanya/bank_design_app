import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:bank_ui_design/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets("test transaction page to find app bar row", (widgetTester) async{

    var transactionPage= TransactionPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionPage));

    expect(find.text('TRANSACTION'), findsOneWidget);

    var backArrow =find.byIcon(Icons.arrow_back_ios);
    await widgetTester.tap(backArrow);
    await widgetTester.pumpAndSettle();

  });

  testWidgets("test transaction page to find forward icons", (widgetTester) async{

    var transactionPage= TransactionPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionPage));

    var backArrow =find.byIcon(Icons.arrow_forward);
    expect(backArrow, findsNWidgets(2));

  });

  testWidgets("test transaction page to find from bank account", (widgetTester) async{

    var transactionPage= TransactionPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionPage));

    var fromBankAccount =find.text('From Bank Account');
    expect(fromBankAccount, findsOneWidget);

    var accountKey= find.byKey(const Key('from_bank_account_key'));
    expect(accountKey, findsOneWidget);
    await widgetTester.tap(accountKey);
    await widgetTester.pumpAndSettle();
  });

  testWidgets("test transaction page to find to bank account", (widgetTester) async{

    var transactionPage= TransactionPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionPage));

    var fromBankAccount =find.text('To Bank Account');
    expect(fromBankAccount, findsOneWidget);

    // Verify that the initial state is as expected
    expect(find.text('SELECT'), findsOneWidget);
    expect(find.text('Select some role'), findsNothing);

    // // Open the dropdown
    var dropdown1= find.byType(DropdownButtonFormField<String>);

    var selectKey= find.byKey(const Key('select_key'));
    await widgetTester.tap(selectKey);
    await widgetTester.pumpAndSettle();

    // Select an item from the dropdown
    // await widgetTester.tap(find.text('Account 1'));
    // await widgetTester.pumpAndSettle();


  });

  testWidgets("test transaction page to find amount", (widgetTester) async{

    var transactionPage= TransactionPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionPage));

    var fromBankAccount =find.text('Amount');
    expect(fromBankAccount, findsNWidgets(2));

    var accountKey= find.byKey(const Key('dollar_key'));
    expect(accountKey, findsOneWidget);

    var amountKey= find.byKey(const Key('amount_key'));
    expect(amountKey, findsOneWidget);

    await widgetTester.enterText(amountKey, ''); //182.3, 633.0
    await widgetTester.tap(find.byKey(const Key('send_key')));
    await widgetTester.pumpAndSettle();

  });

  testWidgets("test transaction page to find message", (widgetTester) async{

    var transactionPage= TransactionPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionPage));

    var message =find.text('Messages');
    expect(message, findsNWidgets(1));

    var messageKey= find.byKey(const Key('message_key'));
    expect(messageKey, findsOneWidget);

  });

  testWidgets("test transaction page to find send button", (widgetTester) async{

    var transactionPage= TransactionPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionPage));

    var send =find.text('SEND');
    expect(send, findsNWidgets(1));

    var sendKey= find.byKey(const Key('send_key'));
    expect(sendKey, findsOneWidget);
    await widgetTester.dragUntilVisible(send, find.byType(SingleChildScrollView), Offset(182.3, 633.0));
    await widgetTester.tap(send);
    await widgetTester.pumpAndSettle();

  });

  testWidgets("test transaction page to find cancel button", (widgetTester) async{

    var transactionPage= TransactionPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionPage));

    expect(find.text('or'), findsOneWidget);
    var cancel =find.text('CANCEL');
    expect(cancel, findsNWidgets(1));

    var cancelKey= find.byKey(const Key('cancel_key'));
    expect(cancelKey, findsOneWidget);
    await widgetTester.dragUntilVisible(cancel, find.byType(SingleChildScrollView), Offset(613.7, 633.0));
    await widgetTester.tap(cancel);
    await widgetTester.pumpAndSettle();

  });



}
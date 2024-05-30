import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:bank_ui_design/transfer_page/success_page.dart';
import 'package:bank_ui_design/transfer_page/transfer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  
  testWidgets("test transfer page to find appbar row", (widgetTester) async{
    
    var transfer = Transfer(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);
    
    await widgetTester.pumpWidget(MaterialApp(home: transfer));

    expect(find.byType(Row), findsOneWidget);

    expect(find.text('TRANSFER'), findsOneWidget);

    var backIcon = find.byIcon(Icons.arrow_back_ios);
    expect(backIcon, findsOneWidget);
    await widgetTester.tap(backIcon);
    await widgetTester.pumpAndSettle();
  });

  testWidgets("test transfer page to find circle icon and send to text", (widgetTester) async{

    var transfer = Transfer(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transfer));

    expect(find.text('SEND TO'), findsOneWidget);

    expect(find.byIcon(Icons.account_circle_sharp), findsOneWidget);

    expect(find.byKey(const Key('send_to_key')), findsOneWidget);

    await widgetTester.enterText(find.byKey(const Key('send_to_key')), '');
    await widgetTester.tap(find.text('SUBMIT'));
    await widgetTester.pumpAndSettle();
    expect(find.text('Please enter send to'), findsOneWidget);
  });

  testWidgets("test transfer page to find bank account details", (widgetTester) async{

    var transfer = Transfer(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transfer));

    expect(find.text('BANK ACCOUNT or UPI'), findsOneWidget);

    await widgetTester.enterText(find.byKey(const Key('bank_account_key')), '');
    await widgetTester.tap(find.text('SUBMIT'));
    await widgetTester.pumpAndSettle();
    expect(find.text('Please enter bank account or upi'), findsOneWidget);
  });

  testWidgets("test transfer page to find amount details", (widgetTester) async{

    var transfer = Transfer(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transfer));

    expect(find.text('Amount'), findsWidgets);

    await widgetTester.enterText(find.byKey(const Key('amount_key')), '');
    await widgetTester.tap(find.text('SUBMIT'));
    await widgetTester.pumpAndSettle();
    expect(find.text('Please enter Amount'), findsOneWidget);
  });

  testWidgets("test transfer page to find elevated button", (widgetTester) async{

    var transfer = Transfer(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transfer));

    var submitKey= find.byKey(const Key('submit_key'));
    expect(submitKey, findsOneWidget);
    await widgetTester.tap(find.text('SUBMIT'));
    
    await widgetTester.pumpAndSettle();
    //expect(find.byType(SuccessPage), findsOneWidget);
  });
}
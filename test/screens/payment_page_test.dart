import 'package:bank_ui_design/consts/user_details_const.dart';
import 'package:bank_ui_design/screens/payment_page.dart';
import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  
  testWidgets("test payment page to find drawer", (widgetTester) async{
    
    var paymentPage = PaymentPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);
    
    await widgetTester.pumpWidget(MaterialApp(home: paymentPage));

    var menuIcon = find.byIcon(Icons.menu);
    expect(menuIcon, findsOneWidget);
    await widgetTester.tap(menuIcon);
    await widgetTester.pumpAndSettle();

    expect(find.text('PAYMENT'), findsOneWidget);

  });

  testWidgets("test payment page to find navigate to previous page", (widgetTester) async{

    var paymentPage = PaymentPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: paymentPage));

    var backIcon = find.byIcon(Icons.arrow_back_ios);
    expect(backIcon, findsOneWidget);
    await widgetTester.tap(backIcon);
    await widgetTester.pumpAndSettle();
  });

  testWidgets("test payment page to find balance details", (widgetTester) async{

    var paymentPage = PaymentPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: paymentPage));

    var menuIcon = find.byIcon(Icons.account_circle_sharp);
    expect(menuIcon, findsOneWidget);

    expect(find.text('BALANCE'), findsOneWidget);
    expect(find.text('\$4,180.20'), findsOneWidget);

  });

  testWidgets("test payment page to find gridview.builder", (widgetTester) async{

    var paymentPage = PaymentPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: paymentPage));

    for(int index = 0; index < 18; index++){
      var iconItems = find.byIcon(icons[index]);
     // expect(iconItems, findsOneWidget);

      // var iconName = find.text(iconNames[index]);
      // expect(iconName, findsOneWidget);
    }
  });

  testWidgets("test payment page to find more less text", (widgetTester) async{

    var paymentPage = PaymentPage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: paymentPage));

    expect(find.text("more>>"), findsOneWidget);

    var moreText= find.text("more>>");
    expect(moreText, findsOneWidget);
    await widgetTester.dragUntilVisible(moreText, find.byType(SingleChildScrollView), Offset(726.0, 745.0));
    await widgetTester.tap(moreText);
    await widgetTester.pumpAndSettle();

  });

}
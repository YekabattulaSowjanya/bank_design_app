import 'package:bank_ui_design/consts/user_details_const.dart';
import 'package:bank_ui_design/screens/home_page.dart';
import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:bank_ui_design/transfer_page/transfer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  
  testWidgets("test home page to find app bar", (widgetTester) async{
    
    var homePage = HomePage(user: User(email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'),);

    await widgetTester.pumpWidget(MaterialApp(home: homePage));

    var menuIcon = find.byIcon(Icons.menu);
    expect(menuIcon, findsOneWidget);
    await widgetTester.tap(menuIcon);
    await widgetTester.pumpAndSettle();//95.0, 64.0

    expect(find.byIcon(Icons.person), findsWidgets);

    expect(find.text('BALANCE'), findsOneWidget);
    expect(find.text('\$4,180.20'), findsOneWidget);
  });

  testWidgets("test home page to find navigate to another page", (widgetTester) async{

    var homePage = HomePage(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'),);

    await widgetTester.pumpWidget(MaterialApp(home: homePage));

    var transferText = find.text('TRANSFER');
    expect(transferText, findsOneWidget);
    await widgetTester.tap(transferText);
    await widgetTester.pumpAndSettle();
    expect(find.byType(Transfer), findsOneWidget);
  });
 
  testWidgets("test home page to find latest transactions", (widgetTester) async{

    var homePage = HomePage(user: User(email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'),);

    await widgetTester.pumpWidget(MaterialApp(home: homePage));
    
    expect(find.text('LATEST TRANSACTIONS'), findsOneWidget);

  });

  testWidgets("test home page to find list view. builder", (widgetTester) async{

    var homePage = HomePage(user: User(email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'),);

    await widgetTester.pumpWidget(MaterialApp(home: homePage));

    expect(find.text('LATEST TRANSACTIONS'), findsOneWidget);

    for (int index = 0; index < 20; index++) {
      var titleText = find.text(transactions[index].title);
      expect(titleText, findsOneWidget);

      var subTitleText = find.text(transactions[index].subTitle);
      expect(subTitleText, findsOneWidget);

      // var amountText = find.text(transactions[index].amount);
      // expect(amountText, findsOneWidget);
    }

  });

  testWidgets("test home page to find gesture detector", (widgetTester) async{

    var homePage = HomePage(user: User(email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'),);

    await widgetTester.pumpWidget(MaterialApp(home: homePage));

    var moreText= find.text("more >>");
    expect(moreText, findsOneWidget);
    await widgetTester.dragUntilVisible(moreText, find.byType(SingleChildScrollView), Offset(719.0, 727.0));
    await widgetTester.tap(moreText);
    await widgetTester.pumpAndSettle();

  });
}
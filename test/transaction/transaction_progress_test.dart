import 'package:bank_ui_design/consts/user_details_const.dart';
import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:bank_ui_design/transaction/transaction_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'transaction_progress_test.mocks.dart';

@GenerateMocks([TransactionProgress])
void main(){

  testWidgets("test transaction progress page to find app bar", (widgetTester) async{

    var transactionProgress= TransactionProgress(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionProgress));

    expect(find.byType(SingleChildScrollView), findsOneWidget);

    var menuIcon = find.byIcon(Icons.menu);
    expect(menuIcon, findsOneWidget);
    await widgetTester.tap(menuIcon);
    await widgetTester.pumpAndSettle();

    expect(find.text('TRANSACTION'), findsOneWidget);
  });

  testWidgets("test transaction progress page to find navigate to the previous page", (widgetTester) async{

    var transactionProgress= TransactionProgress(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionProgress));

    var backArrow =find.byIcon(Icons.arrow_back_ios);
    await widgetTester.tap(backArrow);
    await widgetTester.pumpAndSettle();

  });

  /// true showComplete scenario
  testWidgets("test transaction progress page to find complete container button", (widgetTester) async{

    var transactionProgress= TransactionProgress(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionProgress));

    var completeText = find.text('COMPLETE');
    expect(completeText, findsOneWidget);
    await widgetTester.tap(completeText);
    await widgetTester.pumpAndSettle();

  });

  testWidgets("test transaction progress page to find complete listview", (widgetTester) async{

    var transactionProgress= TransactionProgress(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionProgress));

    for(int realIndex= 1; realIndex< 20; realIndex++){
      var titleText= find.text(transactions[realIndex].title);
      expect(titleText, findsWidgets);
      var subTitleText= find.text(transactions[realIndex].subTitle);
      expect(subTitleText, findsWidgets);
      var amountText= find.text(transactions[realIndex].amount);
      expect(amountText, findsWidgets);

    }
  });

  testWidgets("test transaction progress page to find pagination decrement", (widgetTester) async{

    var transactionProgress= TransactionProgress(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionProgress));

    var backIosArrow= find.byIcon(Icons.arrow_back_ios_new);
    expect(find.text('3'), findsOneWidget);
    expect(backIosArrow, findsOneWidget);
    await widgetTester.dragUntilVisible(backIosArrow, find.byType(SingleChildScrollView), Offset(126.3, 724.0));
    await widgetTester.tap(backIosArrow);
    await widgetTester.pumpAndSettle();

    // After tapping the decrement button, currentPage should be decremented by 1
    expect(find.text('4'), findsNothing);
    expect(find.text('2'), findsOneWidget);

  });

  testWidgets("test transaction progress page to find pagination 1", (widgetTester) async{

    var transactionProgress= TransactionProgress(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionProgress));

    var currentPageKey= find.byKey(const Key('current_page_key')).first;
    expect(currentPageKey, findsWidgets);
    await widgetTester.dragUntilVisible(currentPageKey, find.byType(SingleChildScrollView), Offset(267.7, 724.0));
    await widgetTester.tap(currentPageKey);
    await widgetTester.pumpAndSettle();

  });

  testWidgets("test transaction progress page to find pagination forward icon", (widgetTester) async{

    var transactionProgress= TransactionProgress(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionProgress));

    var forwardIosArrow= find.byIcon(Icons.arrow_forward_ios);
    expect(forwardIosArrow, findsOneWidget);
    await widgetTester.dragUntilVisible(forwardIosArrow, find.byType(SingleChildScrollView), Offset(673.7, 724.0));
    await widgetTester.tap(forwardIosArrow);
    await widgetTester.pumpAndSettle();

  });

  ///false showComplete scenario

  testWidgets("test transaction progress page to find incomplete container button", (widgetTester) async{

    var transactionProgress= TransactionProgress(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);

    await widgetTester.pumpWidget(MaterialApp(home: transactionProgress));

    var incompleteText = find.text('IN PROGRESS');
    expect(incompleteText, findsOneWidget);
    await widgetTester.tap(incompleteText);
    await widgetTester.pumpAndSettle();

  });

}
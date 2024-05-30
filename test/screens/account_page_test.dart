import 'package:bank_ui_design/screens/account_page.dart';
import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets("test account page to find app bar", (widgetTester) async {
    var accountPage = AccountPage(
        user: User(
            email: 'spw@gmail.com',
            password: 'Sowj@123',
            bankAccount: 'credit',
            yourName: 'sowjanya'));

    await widgetTester.pumpWidget(MaterialApp(home: accountPage));

    var accountText= find.text('ACCOUNT');
    expect(accountText, findsOneWidget);

    var arrowBackIcon = find.byIcon(Icons.arrow_back_ios);
    expect(arrowBackIcon, findsOneWidget);
    await widgetTester.tap(arrowBackIcon);
    await widgetTester.pumpAndSettle();
    ///verifying data for navigation pop
    //expect(find.byType(Text), findsOneWidget);
  });

  testWidgets("test account page to find text and text fields widget", (widgetTester) async {
    var accountPage = AccountPage(
        user: User(
            email: 'spw@gmail.com',
            password: 'Sowj@123',
            bankAccount: 'credit',
            yourName: 'sowjanya'));

    await widgetTester.pumpWidget(MaterialApp(home: accountPage));

    var nameText= find.text('YOUR NAME');
    expect(nameText, findsOneWidget);

    var accountIcon = find.byIcon(Icons.account_circle_sharp);
    expect(accountIcon, findsOneWidget);

    await widgetTester.enterText(find.byKey(const Key('your_name_key')), 'dihkjh');

    var bankText= find.text('BANK ACCOUNT');
    expect(bankText, findsOneWidget);

    await widgetTester.enterText(find.byKey(const Key('bank_account_key')), 'nbsnc');

    var emailText= find.text('EMAIL');
    expect(emailText, findsOneWidget);

    await widgetTester.enterText(find.byKey(const Key('email_key')), 'nbsnc@gmail.com');

    var passwordText= find.text('PASSWORD');
    expect(passwordText, findsOneWidget);

    await widgetTester.enterText(find.byKey(const Key('password_key')), 'nbsnc@123');

    var phoneText= find.text('PHONE NUMBER');
    expect(phoneText, findsOneWidget);

    await widgetTester.enterText(find.byKey(const Key('phone_number_key')), 'nbsnc@123');

    var addressText= find.text('YOUR ADDRESS');
    expect(addressText, findsOneWidget);

    await widgetTester.enterText(find.byKey(const Key('address_key')), 'nbsnc-axcd');


  });

  testWidgets("test account page to find paragraph text", (widgetTester) async {
    var accountPage = AccountPage(
        user: User(
            email: 'spw@gmail.com',
            password: 'Sowj@123',
            bankAccount: 'credit',
            yourName: 'sowjanya'));

    await widgetTester.pumpWidget(MaterialApp(home: accountPage));

    var starText= find.text('*');
    expect(starText, findsOneWidget);

     var paragraphText= find.text('Nunc faucibus a pellentesque sit porttitor eget dolor morbi non');
    expect(paragraphText, findsOneWidget);

  });

  testWidgets("test account page to find elevated button", (widgetTester) async {
    var accountPage = AccountPage(
        user: User(
            email: 'spw@gmail.com',
            password: 'Sowj@123',
            bankAccount: 'credit',
            yourName: 'sowjanya'));

    await widgetTester.pumpWidget(MaterialApp(home: accountPage));

    var saveText= find.text('SAVE CHANGES');
    expect(saveText, findsOneWidget);
    await widgetTester.dragUntilVisible(saveText, find.byType(SingleChildScrollView), Offset(400.0, 700.0));
    await widgetTester.tap(saveText);
    await widgetTester.pumpAndSettle();


  });


}

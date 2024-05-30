import 'package:bank_ui_design/log_in/login_screen.dart';
import 'package:bank_ui_design/log_in/register_page.dart';
import 'package:bank_ui_design/provider/user_detailed_register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main(){

  testWidgets("test log in page to find text widget", (widgetTester) async{

    var logInPage= LogInPage();
    await widgetTester.pumpWidget(ChangeNotifierProvider(create: (_) => RegisterUserProvider(),
    child: MaterialApp(home: logInPage)));

    var welcomeText = find.text("WELCOME!");
    expect(welcomeText, findsOneWidget);
  });


  testWidgets("test log in page to find Icon widget", (widgetTester) async{

    var logInPage= LogInPage();
    await widgetTester.pumpWidget(ChangeNotifierProvider(create: (_) => RegisterUserProvider(),
        child: MaterialApp(home: logInPage)));

    var accountIcon = find.byIcon(Icons.account_balance_outlined);
    expect(accountIcon, findsOneWidget);
  });


  testWidgets("test log in page to find Text fields widget", (widgetTester) async{

    var logInPage= LogInPage();
    await widgetTester.pumpWidget(ChangeNotifierProvider(create: (_) => RegisterUserProvider(),
        child: MaterialApp(home: logInPage)));

    await widgetTester.enterText(find.byKey(const Key("email_key")), 'asnb@gmail.com');

  });

  testWidgets("test log in page to find  password Text fields widget", (widgetTester) async{

    var logInPage= LogInPage();
    await widgetTester.pumpWidget(ChangeNotifierProvider(create: (_) => RegisterUserProvider(),
        child: MaterialApp(home: logInPage)));

    await widgetTester.enterText(find.byKey(const Key('password_key')), 'asnb@gmail.com');

    var visibilityIcon = find.byIcon(Icons.visibility_off);
    expect(visibilityIcon, findsOneWidget);

    await widgetTester.tap(visibilityIcon);
    await widgetTester.pumpAndSettle();

  });

  testWidgets("test log in page to find elevated button widget", (widgetTester) async{

    var logInPage= LogInPage();
    await widgetTester.pumpWidget(ChangeNotifierProvider(create: (_) => RegisterUserProvider(),
        child: MaterialApp(home: logInPage)));

    var loginButton = find.byKey(const Key("login_button_key"));
    expect(loginButton, findsOneWidget);
    //await widgetTester.tap(loginButton);
    // await widgetTester.pumpAndSettle();

  });


  testWidgets("test log in page to find forgot password widget", (widgetTester) async{

    var logInPage= LogInPage();
    await widgetTester.pumpWidget(ChangeNotifierProvider(create: (_) => RegisterUserProvider(),
        child: MaterialApp(home: logInPage)));

    var forgotButton = find.byKey(const Key('forgot_password_key'));
    expect(forgotButton, findsOneWidget);
    await widgetTester.tap(forgotButton , warnIfMissed: false);
    await widgetTester.pumpAndSettle();

    //expect(find.text('Forgot Password'), findsOneWidget);
    //expect(find.text('Enter your registered email and new password:'), findsOneWidget);

   // await tester.tap(find.text('Reset Password'));
  });
  
  testWidgets("test log in page to find sign up gesture detector widget", (widgetTester) async{

    var logInPage= LogInPage();
    await widgetTester.pumpWidget(ChangeNotifierProvider(create: (_) => RegisterUserProvider(),
        child: MaterialApp(home: logInPage)));

    var signupButton = find.byKey(const Key('sign_up_key'));
    expect(signupButton, findsOneWidget);

    await widgetTester.dragUntilVisible(signupButton, find.byType(SingleChildScrollView), Offset(594.0, 697.5));
    await widgetTester.tap(signupButton);
    await widgetTester.pumpAndSettle();

    expect(find.byType(RegisterPage), findsOneWidget);
   
  });
}
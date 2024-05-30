import 'package:bank_ui_design/log_in/login_screen.dart';
import 'package:bank_ui_design/log_in/register_page.dart';
import 'package:bank_ui_design/provider/user_detailed_register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'register_page_test.mocks.dart';

@GenerateMocks([RegisterUserProvider])
void main() {

  testWidgets('test login page to find Icons', (widgetTester) async {
    var registerPage = RegisterPage();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => RegisterUserProvider(),
        child: MaterialApp(home: registerPage)));

    var findIcon = find.byType(SingleChildScrollView);
    expect(findIcon, findsOneWidget);

    var findAccountBalanceIcon = find.byIcon(Icons.account_balance_outlined);
    expect(findAccountBalanceIcon, findsOneWidget);

    var findLinkSharpIcon = find.byIcon(Icons.link_sharp);
    expect(findLinkSharpIcon, findsOneWidget);

    var findPhoneAndroidIcon = find.byIcon(Icons.phone_android);
    expect(findPhoneAndroidIcon, findsOneWidget);

    var findConnectText = find.text('Connect to your bank account');
    expect(findConnectText, findsOneWidget);
  });

  testWidgets('test register page to find your name text field with validation', (widgetTester) async {

    final mockRegisterUserProvider =MockRegisterUserProvider();
    var registerPage = RegisterPage();

    when(mockRegisterUserProvider.passwordVisible).thenReturn(true);
    when(mockRegisterUserProvider.isButtonEnabled).thenReturn(true);
    when(mockRegisterUserProvider.isCheckBoxChecked).thenReturn(true);

    await widgetTester.pumpWidget(
        ChangeNotifierProvider<RegisterUserProvider>.value(
        value: mockRegisterUserProvider,
        child: MaterialApp(home: registerPage)));

    await widgetTester.enterText(find.byKey(const Key('full_name_key')), '');

    var key= find.byKey(const Key('sign_up_key'));
    await widgetTester.ensureVisible(key);
    await widgetTester.tap(key);
    await widgetTester.pumpAndSettle();
    expect(find.text("Please enter your name"), findsOneWidget);
  });

  testWidgets('test register page to find bank account text field with validation', (widgetTester) async {

    final mockRegisterUserProvider =MockRegisterUserProvider();
    var registerPage = RegisterPage();

    when(mockRegisterUserProvider.passwordVisible).thenReturn(true);
    when(mockRegisterUserProvider.isButtonEnabled).thenReturn(true);
    when(mockRegisterUserProvider.isCheckBoxChecked).thenReturn(true);

    await widgetTester.pumpWidget(
        ChangeNotifierProvider<RegisterUserProvider>.value(
        value: mockRegisterUserProvider,
        child: MaterialApp(home: registerPage)));

    await widgetTester.enterText(find.byKey(const Key('bank_account_key')), '');

    var key= find.byKey(const Key('sign_up_key'));
    await widgetTester.ensureVisible(key);
    await widgetTester.tap(key);
    await widgetTester.pumpAndSettle();
    expect(find.text("Please enter your bank account"), findsOneWidget);
  });

  testWidgets('test register page to find email text field with validation', (widgetTester) async {

    final mockRegisterUserProvider =MockRegisterUserProvider();
    var registerPage = RegisterPage();

    when(mockRegisterUserProvider.passwordVisible).thenReturn(true);
    when(mockRegisterUserProvider.isButtonEnabled).thenReturn(true);
    when(mockRegisterUserProvider.isCheckBoxChecked).thenReturn(true);

    await widgetTester.pumpWidget(
        ChangeNotifierProvider<RegisterUserProvider>.value(
        value: mockRegisterUserProvider,
        child: MaterialApp(home: registerPage)));

    await widgetTester.enterText(find.byKey(const Key('email_key')), '');

    var key= find.byKey(const Key('sign_up_key'));
    await widgetTester.ensureVisible(key);
    await widgetTester.tap(key);
    await widgetTester.pumpAndSettle();
    expect(find.text("Email is empty"), findsOneWidget);

    ///valid error
    await widgetTester.enterText(find.byKey(const Key('email_key')), 'sdsasa');
    var signUpKey= find.byKey(const Key('sign_up_key'));
    await widgetTester.ensureVisible(signUpKey);
    await widgetTester.tap(signUpKey);
    await widgetTester.pumpAndSettle();
    expect(find.text("Email is not valid"), findsOneWidget);

  });

  testWidgets('test register page to find password text field with validation', (widgetTester) async {

    final mockRegisterUserProvider =MockRegisterUserProvider();
    var registerPage = RegisterPage();

    when(mockRegisterUserProvider.passwordVisible).thenReturn(true);
    when(mockRegisterUserProvider.isButtonEnabled).thenReturn(true);
    when(mockRegisterUserProvider.isCheckBoxChecked).thenReturn(true);

    await widgetTester.pumpWidget(
        ChangeNotifierProvider<RegisterUserProvider>.value(
        value: mockRegisterUserProvider,
        child: MaterialApp(home: registerPage)));

    await widgetTester.enterText(find.byKey(const Key('password_key')), '');

    var key= find.byKey(const Key('sign_up_key'));
    await widgetTester.ensureVisible(key);
    await widgetTester.tap(key);
    await widgetTester.pumpAndSettle();
    expect(find.text("Password is empty"), findsOneWidget);

    ///valid error
    await widgetTester.enterText(find.byKey(const Key('password_key')), '123@1');
    var signUpKey= find.byKey(const Key('sign_up_key'));
    await widgetTester.dragUntilVisible(signUpKey, find.byType(SingleChildScrollView), Offset(187.3, 604.5));
    await widgetTester.tap(signUpKey);
    await widgetTester.pumpAndSettle();
    //expect(find.text("password is not valid"), findsOneWidget);

    ///eye icon
    var visibilityIcon = find.byIcon(Icons.visibility);
    expect(visibilityIcon, findsOneWidget);
    await widgetTester.tap(visibilityIcon);
    await widgetTester.pumpAndSettle();
  });

  testWidgets('test login page to find check boxes', (widgetTester) async {
    var registerPage = RegisterPage();
    final mockRegisterUserProvider =MockRegisterUserProvider();

    when(mockRegisterUserProvider.passwordVisible).thenReturn(true);
    when(mockRegisterUserProvider.isButtonEnabled).thenReturn(true);
    when(mockRegisterUserProvider.isCheckBoxChecked).thenReturn(true);

    await widgetTester.pumpWidget(
        ChangeNotifierProvider<RegisterUserProvider>.value(
            value: mockRegisterUserProvider,
            child: MaterialApp(home: registerPage)));

    var findUseText = find.text('Use 6 characters with a mix of letters, numbers & symbols');
    expect(findUseText, findsOneWidget);

    var checkBoxIcon = find.byIcon(Icons.check_box);
    expect(checkBoxIcon, findsOneWidget);
    await widgetTester.tap(checkBoxIcon);
    await widgetTester.pumpAndSettle();

    var findByText = find.text('By signing up, you agree to Bank\'s Term of Use & Privacy Policy');
    expect(findByText, findsOneWidget);
  });

  testWidgets('test login page to find sign up button', (widgetTester) async {
    var registerPage = RegisterPage();
    final mockRegisterUserProvider =MockRegisterUserProvider();

    when(mockRegisterUserProvider.passwordVisible).thenReturn(true);
    when(mockRegisterUserProvider.isButtonEnabled).thenReturn(true);
    when(mockRegisterUserProvider.isCheckBoxChecked).thenReturn(true);

    await widgetTester.pumpWidget(
        ChangeNotifierProvider<RegisterUserProvider>.value(
            value: mockRegisterUserProvider,
            child: MaterialApp(home: registerPage)));

    var signupKey= find.byKey(const Key('sign_up_key'));
    await widgetTester.dragUntilVisible(signupKey, find.byType(SingleChildScrollView), Offset(187.3, 636.0));
    await widgetTester.tap(signupKey);
    await widgetTester.pumpAndSettle();
    //expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('test login page to find cancel button', (widgetTester) async {
    var registerPage = RegisterPage();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => RegisterUserProvider(),
        child: MaterialApp(home: registerPage)));

    var findCancelText = find.text('CANCEL');
    expect(findCancelText, findsOneWidget);
    await widgetTester.ensureVisible(findCancelText);
    await widgetTester.tap(findCancelText);
    await widgetTester.pumpAndSettle();
  });

  testWidgets('test login page to find login button', (widgetTester) async {
    var registerPage = RegisterPage();

    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => RegisterUserProvider(),
        child: MaterialApp(home: registerPage)));

    var findAlreadyText = find.text('Already signed up?');
    expect(findAlreadyText, findsOneWidget);

    var findLoginText = find.text("Log in");
    expect(findLoginText, findsOneWidget);

    var findLogin = find.byKey(const Key('log_in_key'));
    expect(findLogin, findsOneWidget);
    await widgetTester.ensureVisible(findLogin);
     await widgetTester.tap(findLogin);
     await widgetTester.pumpAndSettle();//563.5, 699.0
     expect(find.byType(LogInPage), findsOneWidget);
  });

}


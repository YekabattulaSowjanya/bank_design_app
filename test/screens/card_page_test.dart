import 'package:bank_ui_design/screens/card_page.dart';
import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  
  testWidgets('test add card page to find row widget', (widgetTester) async{
    
    var addCard =AddCard(user: User(
        email: 'spw@gmail.com',
        password: 'Sowj@123',
        bankAccount: 'credit',
        yourName: 'sowjanya'
    ),);
    
    await widgetTester.pumpWidget(MaterialApp(home: addCard));
  });
}
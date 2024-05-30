import 'package:bank_ui_design/transfer_page/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test success page to find widgets', (tester) async {
    var successPage = SuccessPage(
        sendTo: "sendTo", bankAcoount: "1234567890", amount: "10000");

    await tester.pumpWidget(MaterialApp(home: successPage));

    var checkCircleIcon = find.byIcon(Icons.check_circle_outline);
    expect(checkCircleIcon, findsOneWidget);

    var successMessage = find.text('Money Transferred Successfully');
    expect(successMessage, findsOneWidget);

    var transferMessage = find.text('Transfer to:');
    expect(transferMessage, findsOneWidget);

    var sendTo = find.text("sendTo");
    expect(sendTo, findsOneWidget);
  });

  testWidgets("test success page to find elevated button",
      (widgetTester) async {
    var successPage = SuccessPage(
        sendTo: "sendTo", bankAcoount: "1234567890", amount: "10000");

    await widgetTester.pumpWidget(MaterialApp(home: successPage));

    var doneButton = find.byKey(const Key('done_key'));
    expect(doneButton, findsOneWidget);
    var doneText = find.text("Done");
    expect(doneText, findsOneWidget);

    await widgetTester.tap(find.text("Done"));
    await widgetTester.pumpAndSettle();
  });
}

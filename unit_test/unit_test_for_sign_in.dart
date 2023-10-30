import 'package:charles_ejikeme/auth/sign_in/google_sign_in_page.dart';
import 'package:charles_ejikeme/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('SignIn widget displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SignIn(),
    ));

    // Verify that the expected text elements and widgets are present
    expect(find.text("Hi, my name is"), findsOneWidget);
    expect(find.text("E J I K E M E   C H A R L E S"), findsOneWidget);
    expect(find.text("I make M A G I C with F L U T T E R."), findsOneWidget);
    expect(
        find.text("Would you like to see some of my works?"), findsOneWidget);
    expect(find.byType(RoundButton), findsOneWidget);
  });
}

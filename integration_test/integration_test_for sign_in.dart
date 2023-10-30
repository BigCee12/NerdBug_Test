import 'package:flutter_test/flutter_test.dart';
import 'package:charles_ejikeme/main.dart'; // Import your app's root widget

void main() {
  testWidgets('Sign in with Google', (WidgetTester tester) async {
    // Build your app and wait for it to fully load
    await tester.pumpWidget(const MyApp());

    // Tap the "SIGN WITH GOOGLE" button
    await tester.tap(find.text('SIGN WITH GOOGLE'));

    // Wait for the sign-in process to complete (adjust this to match your app's success screen)
    await tester.pumpAndSettle();

    // Verify that the sign-in was successful by checking for elements on the success screen
    expect(find.text('Welcome'),
        findsOneWidget); // Adjust this to match your success screen content
  });
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:worldmedicalcenter/main.dart' as app;

void main() {
  group("App Test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Login Test", (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      await Future.delayed(Duration(milliseconds: 2000), () {});
      final Finder nextText = find.byKey(const Key("skip"));
      // final Finder text = find.text("Skip Tour");
      // print(nextText);
      await tester.pumpAndSettle();
      // await tester.pumpAndSettle();
      // final gesturedetector = find.byType(GestureDetector).last;
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await tester.tap(nextText);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(milliseconds: 5000), () {});
      // print("=======================================");
      await tester.pumpAndSettle();
      final Finder logingbutton = find.byKey(const Key("Login"));

      await tester.tap(logingbutton);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(milliseconds: 3000), () {});
      await tester.pumpAndSettle();
      final Finder loginbtn = find.byKey(const Key("Login"));
      final Finder EmailForm = find.byKey(const Key("Email"));
      final Finder passwordForm = find.byKey(Key("Password"));

      await tester.pumpAndSettle();

      await tester.enterText(EmailForm, "misrakdnh@gmail.com");
      await tester.enterText(passwordForm, "qwerty");

      await tester.pumpAndSettle();
      await tester.tap(logingbutton);
      await Future.delayed(Duration(milliseconds: 5000), () {});
      await tester.pumpAndSettle();
    });
  });
}

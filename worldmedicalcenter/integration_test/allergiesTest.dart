import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:worldmedicalcenter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("allergies Wdget test", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    await Future.delayed(Duration(milliseconds: 5000), () {});
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
    await Future.delayed(Duration(milliseconds: 1000), () {});
    // print("=======================================");
    await tester.pumpAndSettle();
    final Finder logingbutton = find.byKey(const Key("Login"));

    await tester.tap(logingbutton);
    await tester.pumpAndSettle();
    await Future.delayed(Duration(milliseconds: 1000), () {});
    await tester.pumpAndSettle();
    final Finder loginbtn = find.byKey(const Key("Login"));
    final Finder EmailForm = find.byKey(const Key("Email"));
    final Finder passwordForm = find.byKey(Key("Password"));

    await tester.pumpAndSettle();

    await tester.enterText(EmailForm, "misrakdnh@gmail.com");
    await tester.enterText(passwordForm, "qwerty");

    await tester.pumpAndSettle();
    await tester.tap(logingbutton);
    await tester.pumpAndSettle();
    await Future.delayed(Duration(milliseconds: 6000), () {});
    await tester.pumpAndSettle();

    final Finder expandAllergies = find.byKey(const Key("allergies"));
    final Finder mainContainer = find.byKey(const Key("ScrollMain"));
    final Finder editButton = find.byKey(const Key("allergiesAdd"));
    await tester.tap(expandAllergies);
    await tester.pumpAndSettle();

    await Future.delayed(Duration(milliseconds: 2000), () {});

    await tester.drag(mainContainer, const Offset(0, -700));
    await Future.delayed(Duration(milliseconds: 1000), () {});

    await tester.pumpAndSettle();
    await tester.tap(editButton);
    await tester.pumpAndSettle();
    
  });
}
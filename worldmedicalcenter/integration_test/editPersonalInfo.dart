import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:worldmedicalcenter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Edit Personal Info Test", (WidgetTester tester) async {
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

    await tester.enterText(EmailForm, "pauldessie@gmail.com");
    await tester.enterText(passwordForm, "password");

    await tester.pumpAndSettle();
    await tester.tap(logingbutton);
    await Future.delayed(Duration(milliseconds: 3000), () {});

    final Finder expandPersonal = find.byKey(Key("PersonalInfo"));
    final Finder mainContainer = find.byKey(Key("ScrollMain"));
    final Finder editButton = find.byKey(Key("EditPersonal"));
    await tester.tap(expandPersonal);
    await tester.pumpAndSettle();

    await Future.delayed(Duration(milliseconds: 2000), () {});

    await tester.drag(
        mainContainer,const Offset(0, -300));
    await Future.delayed(Duration(milliseconds: 1000), () {}); 

    await tester.pumpAndSettle();
    await tester.tap(editButton);
    await tester.pumpAndSettle();
    await Future.delayed(Duration(milliseconds: 2000), () {});
  });
}

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

    await Future.delayed(const Duration(milliseconds: 5000), () {});
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
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    // print("=======================================");
    await tester.pumpAndSettle();
    final Finder logingbutton = find.byKey(const Key("Login"));

    await tester.tap(logingbutton);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    await tester.pumpAndSettle();
    final Finder loginbtn = find.byKey(const Key("Login"));
    final Finder EmailForm = find.byKey(const Key("Email"));
    final Finder passwordForm = find.byKey(const Key("Password"));

    await tester.pumpAndSettle();

    await tester.enterText(EmailForm, "misrakdnh@gmail.com");
    await tester.enterText(passwordForm, "qwerty");

    await tester.pumpAndSettle();
    await tester.tap(logingbutton);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 6000), () {});
    await tester.pumpAndSettle();

    final Finder expandPersonal = find.byKey(const Key("PersonalInfo"));
    final Finder mainContainer = find.byKey(const Key("ScrollMain"));
    final Finder editButton = find.byKey(const Key("EditPersonal"));
    await tester.tap(expandPersonal);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(milliseconds: 2000), () {});

    await tester.drag(mainContainer, const Offset(0, -300));
    await Future.delayed(const Duration(milliseconds: 1000), () {});

    await tester.pumpAndSettle();
    await tester.tap(editButton);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    final Finder firstNameField = find.byKey(const Key("First name"));
    final Finder lastNameField = find.byKey(const Key("Last name"));
    final Finder DOBField = find.byKey(const Key("DOB"));
    final Finder GDD = find.byKey(const Key("Gender drop down"));
    final Finder SSNField = find.byKey(const Key("SSN"));
    final Finder nationalityField = find.byKey(const Key("Nationality"));
    final Finder tlf_nr_Field = find.byKey(const Key("Tlf.nr"));
    final Finder saveFormbutton = find.byKey(const Key("Save"));

    await tester.pumpAndSettle();
    await tester.enterText(firstNameField, "NewFirstName");
    await tester.enterText(lastNameField, "NewLastName");
    await tester.enterText(DOBField, "23 Dec 2324");
    await tester.tap(GDD);

    final Finder gendetItem = find.byKey(const Key("Male item"));

    await tester.tap(gendetItem);

    await tester.enterText(SSNField, "0987654321");
    await tester.enterText(nationalityField, "Ethiopian");
    await tester.enterText(tlf_nr_Field, "34258769");
    
    await tester.tap(saveFormbutton);

    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 10000), () {});

  });
}

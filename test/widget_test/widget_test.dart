import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:progulf/screens/main/favourite.dart';

void main() {
  // testWidgets('Input', (tester) async {
  //   await tester.pumpWidget(MaterialApp(
  //     home: Scaffold(
  //       body: Login(),
  //     ),
  //   ));

  //   Finder email = find.byKey(const ValueKey('email'));
  //   await tester.enterText(email, 'bilabthapa');
  //   Finder password = find.byKey(const ValueKey('password'));
  //   await tester.enterText(password, 'bilab123');
  //   Finder login = find.byKey(const ValueKey('login'));
  //   await tester.tap(login);
  //   await tester.pump();
  //   expect(find.text('Logged In Successfully'), findsOneWidget);
  // });

  testWidgets('favtest', (tester) async {
    await Hive.openBox('favourite');
    var box = Hive.box('favourite');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Favourite(),
      ),
    ));

    expect(find.text('Add Some Items to Your Favourites'), findsOneWidget);
    // expect(find.byWidget(Register()), findsOneWidget);
  });
  testWidgets('MyWidget has a title and message', (tester) async {
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}

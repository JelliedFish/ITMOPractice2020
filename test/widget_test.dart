// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/Catalog/view/CatalogView.dart';
import 'package:flutterapp/MainPresenter/MainPresenter.dart';
import 'package:flutterapp/MainScreen/view/MainScreenView.dart';
import 'package:flutterapp/MainScreen/presenter/MainScreenPresenter.dart';

void main() {
  testWidgets('Test for two registration buttons', (WidgetTester tester) async {
    await tester.pumpWidget(MainScreenView());

    // Create the Finders.
    final title2Finder = find.text('Студент');
    final title3Finder = find.text('Преподаватель');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(title2Finder, findsOneWidget);
    expect(title3Finder, findsOneWidget);
  });

  testWidgets('Test for Group Toogle-Button', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.only(top: 5));

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });
  testWidgets('Test for child', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });
  testWidgets('Test for Scaffold', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('H'),
      ),
    ));

    // Find a widget that displays the letter 'H'.
    expect(find.text('H'), findsOneWidget);
  });
  testWidgets('The big test for CatalogScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('H'),
      ),
    ));

    expect(find.text('H'), findsOneWidget);
  });

  testWidgets('finds a widget using a Key', (WidgetTester tester) async {
    final testKey = Key('K');

    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });

  testWidgets('Add and remove a registration form', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(TodoList());

    // Enter 'hi' into the TextField.
    await tester.enterText(find.byType(TextField), 'hi');

  });


    testWidgets('Tests for textField', (WidgetTester tester) async {
      // Build the widget.
      await tester.pumpWidget(TodoList());

      // Enter 'hi' into the TextField.
      await tester.enterText(find.byType(TextField), 'hi');

      // Tap the add button.
      await tester.tap(find.byType(FloatingActionButton));

      // Rebuild the widget with the new item.
      await tester.pump();

      // Expect to find the item on screen.
      expect(find.text('hi'), findsOneWidget);

      // Swipe the item to dismiss it.
      await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));

      // Build the widget until the dismiss animation ends.
      await tester.pumpAndSettle();

      // Ensure that the item is no longer on screen.
      expect(find.text('hi'), findsNothing);
    });
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(TodoList());

      // Enter 'hi' into the TextField.
      await tester.enterText(find.byType(TextField), 'hello');
  });  testWidgets('Generation test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('Hello'),
      ),
    ));

    expect(find.text('Hello'), findsOneWidget);
  });

  testWidgets('finds a widget using a Key', (WidgetTester tester) async {
    final testKey = Key('K');

    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });

  testWidgets('Add and remove a registration form', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(TodoList());

    // Enter 'hi' into the TextField.
    await tester.enterText(find.byType(TextField), 'hi');

  });}

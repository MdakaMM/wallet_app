// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wallet_app/bloc/login/login_bloc.dart';

import 'package:wallet_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  /////Test login
  // group('LoginBloc', () {
  //   late LoginBloc loginBloc;
  //   late SharedPreferences sharedPreferences;

  //   setUp(() async {
  //     sharedPreferences = await SharedPreferences.getInstance();
  //     loginBloc = LoginBloc(sharedPreferences);
  //   });

  //   tearDown(() {
  //     loginBloc.close();
  //   });

  //   test('initial state is LoginInitial', () {
  //     expect(loginBloc.state, equals(LoginInitial()));
  //   });

  //   test(
  //       'emits LoginSuccess when login button is pressed with valid credentials',
  //       () {
  //     final mockUsername = 'testuser';
  //     final mockPassword = 'testpassword';

  //     final expectedStates = [
  //       LoginLoading(),
  //       LoginSuccess(),
  //     ];

  //     expectLater(loginBloc.stream, emitsInOrder(expectedStates));

  //     loginBloc.add(LoginButtonPressed(mockUsername, mockPassword));
  //   });

  //   test(
  //       'emits LoginError when login button is pressed with invalid credentials',
  //       () {
  //     final mockUsername = 'testuser';
  //     final mockPassword = 'short';

  //     final expectedStates = [
  //       LoginLoading(),
  //       LoginError(),
  //     ];

  //     expectLater(loginBloc.stream, emitsInOrder(expectedStates));

  //     loginBloc.add(LoginButtonPressed(mockUsername, mockPassword));
  //   });
  // });
}

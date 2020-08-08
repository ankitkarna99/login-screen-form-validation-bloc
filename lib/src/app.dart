import 'package:LoginScreenFormValidationBLoC/src/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}

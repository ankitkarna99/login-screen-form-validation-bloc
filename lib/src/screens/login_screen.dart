import 'package:LoginScreenFormValidationBLoC/src/blocs/bloc.dart';
import 'package:flutter/material.dart';
import "../blocs/provider.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email Address",
              hintText: "you@example.com",
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter Password",
              errorText: snapshot.error,
            ),
            obscureText: true,
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return RaisedButton(
            child: Text("Login"),
            color: Colors.blue,
            onPressed: snapshot.hasData ? bloc.submit : null,
          );
        });
  }
}

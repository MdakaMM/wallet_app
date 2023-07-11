import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/pages/login/widget/login_form.dart';

import '../../bloc/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: _prefs,
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final SharedPreferences sharedPreferences = snapshot.data!;

          final LoginBloc loginBloc = LoginBloc(sharedPreferences);

          return Scaffold(
            body: BlocListener<LoginBloc, LoginState>(
              bloc: loginBloc,
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                bloc: loginBloc,
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return LoginForm(loginBloc: loginBloc);
                  }
                },
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wallet_app/bloc/login/login_bloc.dart';
import 'package:wallet_app/constants/styling_helper.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;

  const LoginForm({super.key, required this.loginBloc});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 25),
                Text('Welcome Back!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFontSize,
                        color: primaryColor)),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1), blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFE5E5E5),
                  ),
                  child: TextField(
                    controller: _usernameController,
                    style: TextStyle(color: secondaryColor),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        size: 25,
                        Icons.person_outlined,
                        color: secondaryColor,
                      ),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: secondaryColor, height: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  // height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1), blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFE5E5E5),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(color: secondaryColor),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        size: 25,
                        Icons.lock,
                        color: secondaryColor,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: secondaryColor, height: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    widget.loginBloc.add(LoginButtonPressed(
                      _usernameController.text,
                      _passwordController.text,
                    ));
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: secondaryColor,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          ' Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

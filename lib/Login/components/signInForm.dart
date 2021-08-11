import 'dart:ui';

import 'package:flutter/material.dart';

import '../../constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late FocusNode _focusNodeUsername;
  late FocusNode _focusNodePassword;
  final _formKey = GlobalKey<FormState>();

  String? _username = "";
  String? _password = "";

  @override
  void initState() {
    super.initState();
    _focusNodeUsername = FocusNode();
    _focusNodePassword = FocusNode();
  }

  @override
  void dispose() {
    _focusNodeUsername.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextFormField(
                focusNode: _focusNodeUsername,
                onTap: () {
                  _requestUsernameFocus();
                },
                onSaved: (value) => _username = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username is required";
                  }

                  return null;
                },
                cursorColor: _focusNodeUsername.hasFocus
                    ? kippyDarkGreenOne
                    : Colors.black,
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: _focusNodeUsername.hasFocus
                        ? kippyDarkGreenOne
                        : Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDarkGreenOne),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDarkGreenOne),
                    gapPadding: 10,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextFormField(
                focusNode: _focusNodePassword,
                onTap: () {
                  _requestPasswordFocus();
                },
                onSaved: (value) => _password = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }

                  return null;
                },
                cursorColor: _focusNodePassword.hasFocus
                    ? kippyDarkGreenOne
                    : Colors.black,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: _focusNodePassword.hasFocus
                        ? kippyDarkGreenOne
                        : Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDarkGreenOne),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDarkGreenOne),
                    gapPadding: 10,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 30, right: 25),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kippyDarkGreenOne),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {
                    FormState? formState = _formKey.currentState;
                    formState?.save();

                    if (formState!.validate()) {
                      Navigator.of(context).pushReplacementNamed('/dashboard');
                    }
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kippyLightGreenOne),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: kippyDarkGreenTwo)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 18, color: kippyDarkGreenTwo),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: kippyGreen,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  void _requestUsernameFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNodeUsername);
    });
  }

  void _requestPasswordFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNodePassword);
    });
  }
}

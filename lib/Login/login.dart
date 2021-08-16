import 'package:flutter/material.dart';
import 'components/signInForm.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logos/budkippy-logo-drkgrn.png',
                  width: size.width * 0.5,
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Text("BudKippy",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    )),
                SignInForm()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

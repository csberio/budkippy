import 'package:budkippy/routes.dart';
import 'package:flutter/material.dart';

import 'Login/login.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kippyLightGrey,
      ),
      home: Login(),
      routes: routes,
    );
  }
}

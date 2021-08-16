import 'package:budkippy/Dashboard/dashboard.dart';
import 'package:budkippy/Expense/expense.dart';
import 'package:budkippy/Income/income.dart';
import 'package:budkippy/Login/login.dart';
import 'package:budkippy/MainPage/mainpage.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (context) => Login(),
  MainPage.routeName: (context) => MainPage(),
  Dashboard.routeName: (context) => Dashboard(),
  Income.routeName: (context) => Income(),
  Expense.routeName: (context) => Expense()
};

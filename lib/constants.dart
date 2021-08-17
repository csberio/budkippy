import 'package:budkippy/Dashboard/dashboard.dart';
import 'package:budkippy/Expense/expense.dart';
import 'package:budkippy/Income/income.dart';
import 'package:flutter/material.dart';

const kippyLightGreenOne = Color(0xFFB2D8B2);
const kippyLightGreenTwo = Color(0xFF7FBF7F);
const kippyGreen = Color(0xFF46A64C);
const kippyDarkGreenOne = Color(0xFF005900);
const kippyDarkGreenTwo = Color(0xFF004000);
const kippyLightGrey = Color(0xFFF0EEE9);

const kippyDanger = Colors.red;
const kippyWarning = Colors.orange;
const kippySuccess = Colors.greenAccent;
const kippyInfo = Colors.lightBlue;

class CustomDateTime {
  static const _numDays = 100000000;

  static DateTime get min =>
      DateTime.fromMicrosecondsSinceEpoch(0).subtract(Duration(days: _numDays));
  static DateTime get max =>
      DateTime.fromMicrosecondsSinceEpoch(0).add(Duration(days: _numDays));
}

void showSnackBar(BuildContext context, String message, String actionLabel) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: actionLabel,
        onPressed: () {
          // Code to execute.
        },
      ),
    ),
  );
}

BottomNavigationBar buildBottomNavigationBar(
    BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: kippyLightGreenTwo,
    selectedItemColor: kippyDarkGreenOne,
    unselectedItemColor: kippyLightGreenOne,
    currentIndex: currentIndex,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: "Dashboard",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.attach_money),
        label: "Income",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.money_off),
        label: "Expense",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Settings",
      )
    ],
    onTap: (index) {
      if (index != currentIndex) {
        if (index == 0)
          Navigator.of(context).pushReplacementNamed(Dashboard.routeName);
        else if (index == 1)
          Navigator.of(context).pushReplacementNamed(Income.routeName);
        else if (index == 2)
          Navigator.of(context).pushReplacementNamed(Expense.routeName);
        else
          Navigator.of(context).pushReplacementNamed("/settings");
      }
    },
  );
}

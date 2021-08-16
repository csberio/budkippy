import 'package:budkippy/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static final routeName = '/mainpage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
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
          onTap: (index) => {setState(() => currentIndex = index)},
        ),
        body: ListView(
          children: [Text("Income")],
        ));
  }
}

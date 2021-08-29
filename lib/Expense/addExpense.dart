import 'package:budkippy/Expense/components/AddExpenseForm.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key, required this.expenseId}) : super(key: key);

  static String routeName = "/addExpense";
  final int? expenseId;

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: kippyDanger,
                        size: 32,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      "Add Expense",
                      style: TextStyle(
                        fontSize: 24,
                        color: kippyDanger,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AddExpenseForm(),
          ],
        ),
      ),
    );
  }
}

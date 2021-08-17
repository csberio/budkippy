import 'package:budkippy/Income/components/addIncomeForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({Key? key, required this.incomeId}) : super(key: key);

  static String routeName = "/addIncome";
  final int? incomeId;

  @override
  _AddIncomeState createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
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
                        color: kippyDarkGreenOne,
                        size: 32,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      "Add Income",
                      style: TextStyle(
                        fontSize: 24,
                        color: kippyDarkGreenOne,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AddIncomeForm(),
          ],
        ),
      ),
    );
  }
}

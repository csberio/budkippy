import 'package:budkippy/components/CardListItem.dart';
import 'package:budkippy/constants.dart';
import 'package:budkippy/viewModels/expenseViewModel.dart';
import 'package:flutter/material.dart';

class Expense extends StatelessWidget {
  const Expense({Key? key}) : super(key: key);
  static const routeName = '/expenses';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<ExpenseViewModel> expenseList = [
      new ExpenseViewModel(
          1, "ATH Movil", DateTime.now(), -1000.00, kippyDanger),
      new ExpenseViewModel(1, "ATH Movil", DateTime.now(), -50.00, kippyDanger),
      new ExpenseViewModel(1, "ATH Movil", DateTime.now(), -25.56, kippyDanger),
    ];

    expenseList.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(context, 2),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      "Expenses",
                      style: TextStyle(
                        fontSize: 24,
                        color: kippyDanger,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        print("hello world");
                      },
                      child: Icon(
                        Icons.add,
                        color: kippyDanger,
                        size: 32,
                      ),
                    ),
                  )
                ],
              ),
            ),
            buildIncomeCardList(size, expenseList),
          ],
        ),
      ),
    );
  }

  Container buildIncomeCardList(Size size, List<ExpenseViewModel> incomeItems) {
    return Container(
      height: size.height,
      width: size.width,
      child: ListView.builder(
        itemCount: incomeItems.length,
        itemBuilder: (context, index) {
          final item = incomeItems[index];

          return CardListItem(
            cardTitle: item.category,
            cardDate: item.date,
            quantity: item.quantity,
            color: item.color,
          );
        },
      ),
    );
  }
}

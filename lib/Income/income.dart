import 'package:budkippy/components/CardListItem.dart';
import 'package:budkippy/constants.dart';
import 'package:budkippy/viewModels/incomeViewModel.dart';
import 'package:flutter/material.dart';

class Income extends StatelessWidget {
  const Income({Key? key}) : super(key: key);
  static const routeName = '/income';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<IncomeViewModel> incomeList = [
      new IncomeViewModel(1, "ATH Movil", DateTime.now(), 1000.00),
      new IncomeViewModel(1, "ATH Movil", DateTime.now(), 50.00),
      new IncomeViewModel(1, "ATH Movil", DateTime.now(), 25.56),
    ];

    incomeList.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(context, 1),
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
                      "Income",
                      style: TextStyle(
                        fontSize: 24,
                        color: kippyDarkGreenOne,
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
                        color: kippyDarkGreenOne,
                        size: 32,
                      ),
                    ),
                  )
                ],
              ),
            ),
            buildIncomeCardList(size, incomeList),
          ],
        ),
      ),
    );
  }

  Container buildIncomeCardList(Size size, List<IncomeViewModel> incomeItems) {
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
              color: kippyGreen);
        },
      ),
    );
  }
}

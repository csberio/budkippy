import 'package:budkippy/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  static const routeName = '/dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  Object? currentCardValue = 1001;
  Object? currentGraphValue = 1001;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(context, 0),
      body: Container(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Row(
                children: [
                  // Icon(Icons.dashboard),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    "Dashboard",
                    style: TextStyle(
                      fontSize: 24,
                      color: kippyDarkGreenTwo,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Monthly",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          DropdownButton(
                            value: currentCardValue,
                            onChanged: (value) {
                              setState(() => currentCardValue = value);
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text("Up till now"),
                                value: 1001,
                              ),
                              DropdownMenuItem(
                                child: Text("Last Week"),
                                value: 1002,
                              ),
                              DropdownMenuItem(
                                child: Text("Today"),
                                value: 1003,
                              ),
                              DropdownMenuItem(
                                child: Text("By Month"),
                                value: 1004,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Income",
                          ),
                          Text(
                            "\$500.56",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Expenses",
                          ),
                          Text(
                            "-\$500.56",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Income/Expense Summary",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          DropdownButton(
                            value: currentGraphValue,
                            onChanged: (value) {
                              setState(() => currentGraphValue = value);
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text("Up till now"),
                                value: 1001,
                              ),
                              DropdownMenuItem(
                                child: Text("Last Week"),
                                value: 1002,
                              ),
                              DropdownMenuItem(
                                child: Text("Today"),
                                value: 1003,
                              ),
                              DropdownMenuItem(
                                child: Text("By Month"),
                                value: 1004,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: SizedBox(
                        height: size.height * 0.3,
                        child: charts.LineChart(
                          _sampleData(),
                          animate: false,
                          defaultRenderer: new charts.LineRendererConfig(
                              includePoints: true),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Text(
                                "Income",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Text(
                                "Expense",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Latest changes",
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child:
                          SizedBox(height: size.height * 0.3, child: Column()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static List<charts.Series<Budget, int>> _sampleData() {
    return [
      new charts.Series(
        id: "Income",
        data: [
          new Budget(1, 10, DateTime.now(), 1001),
          new Budget(2, 5, DateTime.now(), 1001),
          new Budget(3, 2, DateTime.now(), 1001),
          new Budget(4, 50, DateTime.now(), 1001),
          new Budget(5, 60, DateTime.now(), 1001),
          new Budget(6, 45, DateTime.now(), 1001),
          new Budget(7, 15, DateTime.now(), 1001),
          new Budget(8, 22, DateTime.now(), 1001),
          new Budget(9, 37, DateTime.now(), 1001),
          new Budget(10, 51, DateTime.now(), 1001),
          new Budget(11, 8, DateTime.now(), 1001),
          new Budget(12, 14, DateTime.now(), 1001),
        ],
        domainFn: (Budget item, _) => item.budgetId,
        measureFn: (Budget item, _) => item.quantity,
        colorFn: (Budget item, _) => charts.MaterialPalette.green.shadeDefault,
      ),
      new charts.Series(
        id: "Expense",
        data: [
          new Budget(1, 4, DateTime.now(), 1002),
          new Budget(2, 5, DateTime.now(), 1002),
          new Budget(3, 2, DateTime.now(), 1002),
          new Budget(4, 20, DateTime.now(), 1002),
          new Budget(5, 30, DateTime.now(), 1002),
          new Budget(6, 34, DateTime.now(), 1002),
          new Budget(7, 8, DateTime.now(), 1002),
          new Budget(8, 12, DateTime.now(), 1002),
          new Budget(9, 56, DateTime.now(), 1002),
          new Budget(10, 29, DateTime.now(), 1002),
          new Budget(11, 4, DateTime.now(), 1002),
          new Budget(12, 15, DateTime.now(), 1002),
        ],
        domainFn: (Budget item, _) => item.budgetId,
        measureFn: (Budget item, _) => item.quantity,
        colorFn: (Budget item, _) => charts.MaterialPalette.red.shadeDefault,
      ),
    ];
  }
}

class Budget {
  final int budgetId;
  final int quantity;
  final DateTime date;
  final int typeCode;

  Budget(this.budgetId, this.quantity, this.date, this.typeCode);
}

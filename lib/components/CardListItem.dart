import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class CardListItem extends StatelessWidget {
  const CardListItem({
    Key? key,
    required this.cardTitle,
    required this.cardDate,
    required this.quantity,
    required this.color,
  }) : super(key: key);

  final String cardTitle;
  final DateTime cardDate;
  final double quantity;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cardTitle,
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Text(
                    "\$ {0}".replaceAll("{0}", quantity.toString()),
                    style: TextStyle(
                      color: color,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                children: [
                  Text(
                    DateFormat(LongDateDisplay).format(cardDate),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

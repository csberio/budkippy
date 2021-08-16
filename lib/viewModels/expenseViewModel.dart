import 'package:flutter/material.dart';

class ExpenseViewModel {
  final int incomeId;
  final String category;
  final DateTime date;
  final double quantity;
  final Color color;
  ExpenseViewModel(
      this.incomeId, this.category, this.date, this.quantity, this.color);
}

import 'package:budkippy/DropDownList/incomeCategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({Key? key}) : super(key: key);

  @override
  _AddExpenseFormState createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  late FocusNode _fNCategory;
  late FocusNode _fnQuantity;
  late FocusNode _fnDateTime;
  late FocusNode _fNDescription;

  final _formKey = GlobalKey<FormState>();

  final _dateTimeController = TextEditingController();
  List<DropdownMenuItem<int>> _categoriesList = [];

  int? _category = 0;
  double? _quantity = 0;
  DateTime _date = DateTime.now();
  DateTime _dateTime = new DateTime.now();
  String? _description = "";

  @override
  void initState() {
    super.initState();
    _fNCategory = FocusNode();
    _fnQuantity = FocusNode();
    _fnDateTime = FocusNode();
    _fNDescription = FocusNode();

    _dateTimeController.text = formatDate(_dateTime);

    getIncomeCategories();
  }

  @override
  void dispose() {
    _fNCategory.dispose();
    _fnQuantity.dispose();
    _fnDateTime.dispose();
    _fNDescription.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: Text(
                "Quantity",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: TextFormField(
                focusNode: _fnQuantity,
                keyboardType: TextInputType.number,
                onTap: () {},
                onSaved: (value) {
                  if (value != null) {
                    final double? intValue = double.tryParse(value);
                    if (intValue != null) {
                      _quantity = intValue;
                    }
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Quantity is a required field.";
                  } else {
                    final val = double.tryParse(value);

                    if (val == null) {
                      return "Must be a number.";
                    }
                  }
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "0.00",
                  hintStyle: TextStyle(fontSize: 24),
                  prefixIcon: Icon(
                    Icons.attach_money,
                    color: _fnQuantity.hasFocus ? kippyDanger : Colors.grey,
                    size: 24,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: Text(
                "Date",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: TextFormField(
                focusNode: _fnDateTime,
                controller: _dateTimeController,
                keyboardType: TextInputType.datetime,
                onTap: () {
                  _selectDateTime();
                },
                onSaved: (value) {
                  if (value != null) {}
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Date is a required field.";
                  }
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "MM/DD/YYYY HH:MM AM/PM",
                  hintStyle: TextStyle(fontSize: 18),
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: _fnDateTime.hasFocus ? kippyDanger : Colors.grey,
                    size: 24,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: Text(
                "Category",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 5,
              ),
              child: DropdownButtonFormField(
                focusNode: _fNCategory,
                value: 1001,
                items: _categoriesList,
                onChanged: (value) {
                  _category = value as int?;
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(fontSize: 18),
                  prefixIcon: Icon(
                    Icons.category,
                    color: _fNCategory.hasFocus ? kippyDanger : Colors.grey,
                    size: 24,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 5,
              ),
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 3,
              ),
              child: TextFormField(
                focusNode: _fNDescription,
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 10,
                onTap: () {},
                onSaved: (value) {
                  if (value != null) {
                    final String? descValue = value;
                    if (descValue != null) {
                      _description = descValue;
                    }
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description is a required field.";
                  }
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(fontSize: 18),
                  prefixIcon: Icon(
                    Icons.description,
                    color: _fNDescription.hasFocus ? kippyDanger : Colors.grey,
                    size: 24,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kippyDanger),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {
                    FormState? formState = _formKey.currentState;
                    formState?.save();

                    if (formState!.validate()) {
                      print(
                          "Quantity: $_quantity, Date: $_dateTime, Category: $_category, Description: $_description");
                    }
                  },
                  child: Text("Save",
                      style: TextStyle(fontSize: 24, color: kippyLightGrey)),
                ),
              ),
            ),
          ],
        ));
  }

  getIncomeCategories() {
    final incomeCategories = IncomeCategories;

    for (var item in incomeCategories) {
      _categoriesList.add(
        DropdownMenuItem(
          child: Text(item.text),
          value: item.value,
        ),
      );
    }
  }

  Future _selectDateTime() async {
    final date = await _selectDate();
    if (date == null) {
      return;
    }

    final time = await _selectTime();
    if (time == null) return;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    _dateTimeController.text = formatDate(dateTime);

    setState(() {
      _dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime?> _selectDate() async {
    int currentYear = DateTime.now().year;

    DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(currentYear - 3),
      lastDate: new DateTime(currentYear + 2),
    );

    return datePicked;
  }

  Future<TimeOfDay?> _selectTime() async {
    DateTime date = new DateTime.now();

    TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: date.hour,
        minute: date.minute,
      ),
    );

    return timePicked;
  }

  String formatDate(DateTime date) {
    return DateFormat('dd/MMM/y h:mm a').format(date);
  }
}

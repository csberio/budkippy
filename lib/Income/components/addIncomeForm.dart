import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class AddIncomeForm extends StatefulWidget {
  const AddIncomeForm({Key? key}) : super(key: key);

  @override
  _AddIncomeFormState createState() => _AddIncomeFormState();
}

class _AddIncomeFormState extends State<AddIncomeForm> {
  late FocusNode _fNCateogry;
  late FocusNode _fnQuantity;
  late FocusNode _fnDateTime;
  late FocusNode _fNDescription;

  final _formKey = GlobalKey<FormState>();

  final _dateTimeController = TextEditingController();

  int? _category = 0;
  int? _quantity = 0;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  DateTime _dateTime = new DateTime.now();
  String? _description = "";

  @override
  void initState() {
    super.initState();
    _fNCateogry = FocusNode();
    _fnQuantity = FocusNode();
    _fnDateTime = FocusNode();
    _fNDescription = FocusNode();

    _dateTimeController.text = formatDate(_dateTime);
  }

  @override
  void dispose() {
    _fNCateogry.dispose();
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
                    final int? intValue = int.tryParse(value);
                    if (intValue != null) {
                      _quantity = intValue;
                    }
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Quantity is a required field.";
                  } else {
                    final val = int.tryParse(value);

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
                    color:
                        _fnQuantity.hasFocus ? kippyDarkGreenOne : Colors.grey,
                    size: 24,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDarkGreenOne),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDarkGreenOne),
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
                  print(value);
                  if (value != null) {
                    print(value);
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Date is a required field.";
                  } else {
                    final val = int.tryParse(value);

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
                  hintText: "MM/DD/YYYY HH:MM AM/PM",
                  hintStyle: TextStyle(fontSize: 18),
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color:
                        _fnQuantity.hasFocus ? kippyDarkGreenOne : Colors.grey,
                    size: 24,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDarkGreenOne),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDarkGreenOne),
                    gapPadding: 10,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: kippyDanger),
                    gapPadding: 10,
                  ),
                ),
              ),
            )
          ],
        ));
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

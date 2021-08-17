import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class AddIncomeForm extends StatefulWidget {
  const AddIncomeForm({Key? key}) : super(key: key);

  @override
  _AddIncomeFormState createState() => _AddIncomeFormState();
}

class _AddIncomeFormState extends State<AddIncomeForm> {
  late FocusNode _fNCateogry;
  late FocusNode _fnQuantity;
  late FocusNode _fnDate;
  late FocusNode _fNDescription;

  final _formKey = GlobalKey<FormState>();

  int? _category = 0;
  int? _quantity = 0;
  DateTime? _date = DateTime.now();
  String? _description = "";

  @override
  void initState() {
    super.initState();
    _fNCateogry = FocusNode();
    _fnQuantity = FocusNode();
    _fnDate = FocusNode();
    _fNDescription = FocusNode();
  }

  @override
  void dispose() {
    _fNCateogry.dispose();
    _fnQuantity.dispose();
    _fnDate.dispose();
    _fNDescription.dispose();
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
                focusNode: _fnQuantity,
                keyboardType: TextInputType.datetime,
                initialValue: "",
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
            )
          ],
        ));
  }
}

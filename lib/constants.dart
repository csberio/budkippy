import 'package:flutter/material.dart';

const kippyLightGreenOne = Color(0xFFB2D8B2);
const kippyLightGreenTwo = Color(0xFF7FBF7F);
const kippyGreen = Color(0xFF46A64C);
const kippyDarkGreenOne = Color(0xFF005900);
const kippyDarkGreenTwo = Color(0xFF004000);

const kippyDanger = Colors.red;
const kippyWarning = Colors.orange;
const kippySuccess = Colors.greenAccent;
const kippyInfo = Colors.lightBlue;

void showSnackBar(BuildContext context, String message, String actionLabel) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: actionLabel,
        onPressed: () {
          // Code to execute.
        },
      ),
    ),
  );
}

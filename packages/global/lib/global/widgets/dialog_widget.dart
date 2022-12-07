import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String? title;
  final String? message;
  final String? positiveBtnText;
  final String negativeBtnText;
  final Function onPostivePressed;
  final Function onNegativePressed;
  final double circularBorderRadius;

  const CustomAlertDialog({
    Key? key,
    this.title,
    this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText,
    required this.negativeBtnText,
    required this.onPostivePressed,
    required this.onNegativePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: message != null ? Text(message!) : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        negativeBtnText != null
            ? TextButton(
                // textColor: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  Navigator.of(context).pop();
                  onNegativePressed();
                },
                child: Text(negativeBtnText),
              )
            : const SizedBox(),
        positiveBtnText != null
            ? TextButton(
                onPressed: () {
                  onPostivePressed();
                },
                child: Text(positiveBtnText!),
              )
            : const SizedBox(),
      ],
    );
  }
}

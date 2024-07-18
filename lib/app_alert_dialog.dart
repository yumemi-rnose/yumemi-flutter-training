import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    required Exception exception,
    super.key,
  }) : _exception = exception;

  final Exception _exception;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(_exception.toString()),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

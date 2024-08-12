import 'package:flutter/material.dart';

const alertDialogKey = Key('alertDialog');

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    required Exception exception,
    super.key,
  }) : _exception = exception;

  final Exception _exception;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: alertDialogKey,
      content: Text(_exception.toString()),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      actions: <Widget>[
        TextButton(
          onPressed: () => _close(context),
          child: const Text('OK'),
        ),
      ],
    );
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }
}

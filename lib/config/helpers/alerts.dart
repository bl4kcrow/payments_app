import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) =>
        AlertDialog(title: Text('Wait...'), content: LinearProgressIndicator()),
  );
}

showAlert(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        MaterialButton(child: Text('Ok'), onPressed: () => context.pop()),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

import '../continue_button.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(
    BuildContext context, {required String title,}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
            content: Text(
              title,
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              ContinueButton(
                  text: 'Okay',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  backgroundColor: Theme.of(context).primaryColorDark)
            ],
          );
        });
  }
}

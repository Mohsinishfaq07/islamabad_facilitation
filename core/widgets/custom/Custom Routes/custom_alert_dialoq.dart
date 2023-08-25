import 'package:flutter/material.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(
    BuildContext context, {
    required String title,
    bool isSuccess = false,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: isSuccess
                ? const CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    ))
                : const CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.highlight_remove_sharp,
                      color: Colors.white,
                    )),
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

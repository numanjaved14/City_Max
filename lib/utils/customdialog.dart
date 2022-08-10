import 'package:flutter/material.dart';

import '../main/mainscreen.dart';

class Customdialog {
  static Widget showdialog() {
    return CircularProgressIndicator(
      color: Colors.black,
      // size: 50,
    );
  }

  void showInSnackBar(String value, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  static void showDialogBox(String res, BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              //alignment: Alignment.center,
              actions: [
                ElevatedButton(
                    child: Text("OK"),
                    onPressed: () {
                      closeDialog(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MainScreen(),
                        ),
                        (route) => false,
                      );
                    }),
              ],
              insetPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(child: Text(res)),
                ],
              ),
            ),
          );
        });
  }

  static void closeDialog(BuildContext context) {
    Navigator.pop(context);
  }
}

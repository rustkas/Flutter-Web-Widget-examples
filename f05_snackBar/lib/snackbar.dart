import 'package:flutter/material.dart';

class GlobalSnackBar {
  final String msg;

  const GlobalSnackBar({
    @required this.msg,
  });

  static show(
    BuildContext context,
    String msg,
  ) {
    Scaffold.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      content: Text(msg),
      duration: Duration(seconds: 5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        //topRight: Radius.circular(16)
      )),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Ok',
        onPressed: () {},
      ),
    ));
  }
}

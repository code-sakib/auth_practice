import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      msg,
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: const Color(0xFFEF9A9A),
  ));
}

class Utilis {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(errorMsg, {Color color = const Color(0xFFEF9A9A)}) {  
    if (errorMsg == null) return null;

    final snackBar = SnackBar(
      content: Text(errorMsg),
      backgroundColor: color,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

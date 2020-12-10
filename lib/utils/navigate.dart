import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quickstart/router/application.dart';

class Navigate {
  static void to(BuildContext context, String path,
      {TransitionType transition = TransitionType.inFromRight}) {
    Application.router.navigateTo(context, path, transition: transition);
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }
}

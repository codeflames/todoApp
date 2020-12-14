import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(text),
          ),
        );
}

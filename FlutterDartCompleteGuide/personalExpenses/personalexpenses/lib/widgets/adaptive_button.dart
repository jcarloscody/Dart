import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function presentDatePicker;

  AdaptiveFlatButton({required this.text, required this.presentDatePicker});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () {
              presentDatePicker();
            },
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: () {
              presentDatePicker;
            },
            child: Text(text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          );
  }
}

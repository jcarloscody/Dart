import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final bool state;
  final VoidCallback onPressed;
  final String title;
  double? fontSize;
  CustomButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.state,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: state ? null : onPressed,
      child: Text(title),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) return Colors.red;
            if (states.contains(MaterialState.pressed)) return Colors.black;
            return Colors.blue;
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (state) {
            if (state.contains(MaterialState.pressed)) {
              return TextStyle(fontSize: fontSize != null ? fontSize! * 2 : 28);
            }
            return TextStyle(fontSize: fontSize);
          },
        ),
      ),
    );
  }
}

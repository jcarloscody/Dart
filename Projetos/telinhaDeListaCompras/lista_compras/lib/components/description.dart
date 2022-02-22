import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final title;
  final description;

  const Description({Key? key, required this.description, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(this.title),
        ),
        Container(
          child: Text(this.description),
        )
      ],
    );
  }
}

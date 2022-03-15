import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double value;
  final double percentual;

  const ChartBar({
    Key? key,
    required this.day,
    required this.value,
    required this.percentual,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("R\$"),
        FittedBox(
          child: Text("${this.value.toStringAsFixed(2)}"),
        ),
        Container(
          width: 10,
          height: 60,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey),
              ),
              FractionallySizedBox(
                heightFactor: percentual,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ),
              )
            ],
            alignment: Alignment.bottomCenter,
          ),
        ),
        Text("Day: ${this.day}")
      ],
    );
  }
}

import 'package:flutter/material.dart';

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.amber),
          child: const Center(
            child: Text(
              "hello",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(color: Colors.amber),
              child: const Center(
                child: Text(
                  "hello",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(color: Colors.amber),
              child: const Center(
                child: Text(
                  "hello",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

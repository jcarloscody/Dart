import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TranscationList extends StatelessWidget {
  final List<Transaction> transactions;
  const TranscationList({
    Key? key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    const Text("Sem transacoes"),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      child: Image.asset(
                        "assets/img/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  final e = transactions[index];
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text(
                              "R\$ ${e.value}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        radius: 45,
                      ),
                      title: Text("${e.title}"),
                      subtitle: Text("${DateFormat("d MMM y").format(e.date)}"),
                    ),
                  ) /*Card(
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "R\$ ${e.value.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.headline6,
                            // style: TextStyle(
                            //   color: Theme.of(context).primaryColorDark,
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 20,
                            // ),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColorLight,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateFormat("d/MMM/y").format(e.date),
                              style: TextStyle(color: Colors.grey[500]),
                            )
                          ],
                        )
                      ],
                    ),
                  )*/
                      ;
                },
              ));
  }
}

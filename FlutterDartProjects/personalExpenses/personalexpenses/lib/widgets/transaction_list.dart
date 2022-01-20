import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/widgets/transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function deleteTransactions;

  TransactionList(
      {required this.transactions, required this.deleteTransactions});

  @override
  Widget build(BuildContext context) {
    //contexto é essencialmente um objeto com muitos metadados sobre esse widget e sua posicao da arvore de widgets
    return transactions.isEmpty
        ? LayoutBuilder(builder: (contex, constraints) {
            return Column(
              children: [
                Text(
                  'NO transactions added yet!',
                  style: Theme.of(context).textTheme.headline1,
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                transaction: transactions,
                deleteTransaction: deleteTransactions,
                index: index,
              );
            },
            itemCount: transactions.length,
          );
  }
}


/*return Card(
                  child: Row(
                    children: [
                      Container(
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColorDark,
                          width: 2,
                        )),
                        // ignore: prefer_const_constructors
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${transactions[index].amount.toStringAsFixed(2)}',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            // ignore: prefer_const_constructors
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(transactions[index].date),
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );*/

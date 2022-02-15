import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final int index;
  final List<Transaction> transaction;
  final Function deleteTransaction;

  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction[index].amount}'),
            ),
          ),
        ),
        title: Text(
          transaction[index].title,
          style: Theme.of(context).textTheme.headline1,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction[index].date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () {
                  this.deleteTransaction(transaction[index].id);
                },
                icon: Icon(Icons.delete),
                label: const Text(
                    'Delete'), //estamos dizendo que o obj nunca mudará,
                //nao estamos atribuindo nenhum dado dinamico aqui ao cria-lo
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                // ignore: prefer_const_constructors
                icon: Icon(Icons.delete),
                onPressed: () => this.deleteTransaction(transaction[index].id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}

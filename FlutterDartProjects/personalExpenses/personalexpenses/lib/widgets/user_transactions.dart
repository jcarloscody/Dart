import 'package:flutter/material.dart';
import 'package:personalexpenses/models/transaction.dart';
import 'package:personalexpenses/widgets/new_transaction.dart';
import 'package:personalexpenses/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  // ignore: prefer_final_fields
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 0,
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 1,
      title: 'Weekly Groceries',
      amount: 16.56,
      date: DateTime.now(),
    )
  ];

  String _invalid = '';

  void _invalidArgs(String args) {
    setState(() {
      this._invalid = args;
    });
  }

  void _addNewTransaction(Transaction t) {
    setState(() {
      _userTransactions.add(t);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _invalid,
          style: TextStyle(color: Colors.red, backgroundColor: Colors.black),
        ),
        NewTransaction(
          addNewTransaction: _addNewTransaction,
          invalidArgs: _invalidArgs,
        ),
        TransactionList(
          transactions: _userTransactions,
        ),
      ],
    );
  }
}

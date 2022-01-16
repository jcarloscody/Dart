// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  Function addNewTransaction;
  Function invalidArgs;
  NewTransaction({required this.addNewTransaction, required this.invalidArgs});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  int cont = 2;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty ||
        enteredAmount < 0 ||
        amountController.text.isEmpty) {
      widget
          .invalidArgs("wrong! title can't stay empty and amount must be >=0");
    } else {
      widget.invalidArgs('');
      widget.addNewTransaction(Transaction(
        id: ++cont,
        title: titleController.text,
        amount: double.parse(amountController.text),
        date: DateTime.now(),
      ));
      Navigator.of(context).pop(); //fecha a folha movel quando clica em ok
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) => amountController = value,
              controller: amountController,
              keyboardType: TextInputType.number,
              //on iOS, this might not allow for decimal places. Use  TextInputType.numberWithOptions(decimal:true)
              onSubmitted: (_) => submitData,
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Text('No date chosen!'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {},
                    child: Text('Chosen date!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              ),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button?.color,
            ),
          ],
        ),
      ),
    );
  }
}

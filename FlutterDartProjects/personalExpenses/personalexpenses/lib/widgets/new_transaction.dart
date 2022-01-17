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
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  int cont = 2;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty ||
        enteredAmount < 0 ||
        _amountController.text.isEmpty ||
        _selectedDate == null) {
      widget.invalidArgs(
          "wrong! title can't stay empty and amount must be >=0 OR Date must be check");
    } else {
      widget.invalidArgs('');
      widget.addNewTransaction(Transaction(
        id: ++cont,
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        date: (_selectedDate as DateTime),
      ));
      Navigator.of(context).pop(); //fecha a folha movel quando clica em ok
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
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
              controller: _titleController,
            ),
            TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) => amountController = value,
              controller: _amountController,
              keyboardType: TextInputType.number,
              //on iOS, this might not allow for decimal places. Use  TextInputType.numberWithOptions(decimal:true)
              onSubmitted: (_) => _submitData,
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'Add Transaction'
                        : 'Date selected ${DateFormat.yMd().format((_selectedDate as DateTime))}'),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _presentDatePicker,
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
              onPressed: _submitData,
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

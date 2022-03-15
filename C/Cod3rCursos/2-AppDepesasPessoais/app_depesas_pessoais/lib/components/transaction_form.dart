import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function addTransaction;

  const TransactionForm({
    Key? key,
    required this.addTransaction,
  }) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final value = TextEditingController();

  _submit() {
    final value = double.tryParse(this.value.text) ?? 0.0;

    if (title.text.isEmpty || value <= 0) {
      return;
    }
    widget.addTransaction(title.text, value, _selectedDate);
    title.text = '';
    this.value.text = '';
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(label: Text("Titulo")),
              controller: title,
            ),
            TextField(
              decoration: const InputDecoration(label: Text("Valor R\$")),
              controller: value,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (v) {
                _submit();
              },
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada!'
                          : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showDatePicker,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submit,
                  child: Container(
                    child: const Text(
                      "nova transacao",
                      style: TextStyle(
                          //color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: const BoxDecoration(
                      // color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  /*style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 141, 125, 76))),*/
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

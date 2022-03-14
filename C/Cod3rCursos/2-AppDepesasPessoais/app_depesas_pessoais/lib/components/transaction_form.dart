import 'package:flutter/material.dart';

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

  final value = TextEditingController();

  _submit() {
    final value = double.tryParse(this.value.text) ?? 0.0;

    if (title.text.isEmpty || value <= 0) {
      return;
    }
    widget.addTransaction(title.text, value);
    title.text = '';
    this.value.text = '';
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

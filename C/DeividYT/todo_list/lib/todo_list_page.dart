import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = [];

  deleteTarefa(int i) {
    tarefas.removeAt(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              onSubmitted: (v) {
                if (v.length > 0) {
                  setState(() {
                    tarefas.add(_textEditingController.text);
                  });
                }
                _textEditingController.clear();
                print(tarefas);
              },
            ),
            Container(
              height: 400,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tarefas[index]),
                    trailing: Icon(Icons.delete),
                    onTap: () {
                      setState(() {
                        deleteTarefa(index);
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        deleteTarefa(index);
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          if (_textEditingController.text.length > 0) {
            setState(() {
              tarefas.add(_textEditingController.text);
            });
          }
          _textEditingController.clear();
          print(tarefas);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

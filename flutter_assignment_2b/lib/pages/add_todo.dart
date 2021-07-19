import 'package:flutter/material.dart';
import 'package:flutter_assignment_2b/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new Todo"),
      ),
      body: TextField(
        autofocus: true,
        onSubmitted: (todo) async {
          await todoProvider.addTodo(todo);
          Navigator.pop(context);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: "Enter your todo",
        ),
      ),
    );
  }
}

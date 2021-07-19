import 'package:flutter/material.dart';
import 'package:flutter_assignment_2b/pages/add_todo.dart';
import 'package:flutter_assignment_2b/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _removeTodoAlert(BuildContext context, int id) {
    TodoProvider todoProvider =
        Provider.of<TodoProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Remove Todo"),
        content: Text("Are you sure, you want to remove this Todo?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("No")),
          TextButton(
            onPressed: () {
              todoProvider.removeTodo(id);
              Navigator.pop(context);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) {
        if (todoProvider.getTodos == null) {
          todoProvider.loadTodos();
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Todo List"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddTodo())),
              tooltip: "Add Todo",
              child: Icon(Icons.add),
            ),
            body: todoProvider.getTodos!.isEmpty
                ? Center(child: Text("No Todos available"))
                : ListView.builder(
                    itemCount: todoProvider.getTodos!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(todoProvider.getTodos![index].text),
                        onTap: () => _removeTodoAlert(
                          context,
                          todoProvider.getTodos![index].id,
                        ),
                      );
                    },
                  ),
          );
        }
      },
    );
  }
}

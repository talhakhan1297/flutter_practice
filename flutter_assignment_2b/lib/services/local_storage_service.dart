import 'dart:convert';

import 'package:flutter_assignment_2b/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<List<Todo>> getLocalTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todos = prefs.getStringList("todos") ?? [];
    return todos.map((todo) => Todo.fromJson(jsonDecode(todo))).toList();
  }

  Future<void> storeTodosLocally(List<Todo> todos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      "todos",
      todos.map((todo) => jsonEncode(todo.toJson())).toList(),
    );
  }
}

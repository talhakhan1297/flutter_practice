import 'package:flutter/material.dart';
import 'package:flutter_assignment_2b/pages/home.dart';
import 'package:flutter_assignment_2b/providers/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo List',
        theme: ThemeData(),
        home: HomePage(),
      ),
    );
  }
}

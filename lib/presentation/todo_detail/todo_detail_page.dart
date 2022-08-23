import 'package:flutter/material.dart';
import 'package:todo/domain/todo/entities/todo.dart';

class TodoDetailPage extends StatelessWidget {
  final Todo? todo;
  const TodoDetailPage({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(todo == null ? "Create Todo" : "Edit Todo"),
      ),
      body: const Placeholder(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todos/todoForm/todo_form_bloc.dart';
import 'package:todo/domain/todo/entities/todo.dart';
import 'package:todo/injection.dart';
import 'package:todo/presentation/routes/router.gr.dart';
import 'package:todo/presentation/todo_detail/widgets/save_progress_overlay.dart';
import 'package:todo/presentation/todo_detail/widgets/todo_form.dart';

class TodoDetailPage extends StatelessWidget {
  final Todo? todo;
  const TodoDetailPage({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          sl<TodoFormBloc>()..add(InitializeTodoDetailPage(todo: todo)),
      child: BlocConsumer<TodoFormBloc, TodoFormState>(
        listenWhen: (p, c) =>
            p.failureOrSuccessOption != c.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Failure!"),
              backgroundColor: Colors.redAccent,
            )),
            (eitherFailureOrSuccess) => eitherFailureOrSuccess.fold(
              (failure) => null,
              (_) => Navigator.of(context).popUntil(
                  (route) => route.settings.name == HomePageRoute.name),
            ),
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(todo == null ? "Create Todo" : "Edit Todo"),
            ),
            body: Stack(
              children: [
                const TodoForm(),
                SaveInProgressOverlay(isSaving: state.isSaving),
              ],
            ),
          );
        },
      ),
    );
  }
}

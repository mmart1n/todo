import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todos/controller/controller_bloc.dart';
import 'package:todo/domain/todo/entities/todo.dart';
import 'package:todo/presentation/routes/router.gr.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({Key? key, required this.todo}) : super(key: key);

  void _showDeleteDialog({
    required BuildContext context,
    required ControllerBloc controllerBloc,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Selected todo to delete: "),
            content: Text(
              todo.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  controllerBloc.add(DeleteTodoEvent(todo: todo));
                  Navigator.pop(context);
                },
                child: const Text(
                  'DELETE',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
      onTap: () {
        AutoRouter.of(context).push(TodoDetailRoute(todo: todo));
      },
      onLongPress: () {
        final controllerBloc = context.read<ControllerBloc>();
        _showDeleteDialog(
          context: context,
          controllerBloc: controllerBloc,
        );
      },
      child: Material(
        elevation: 16,
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: todo.color.color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: themeData.textTheme.headline1!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  todo.body,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: themeData.textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // wrap the checkbox in sized box in order to remove the padding
                    SizedBox(
                      height: 20,
                      width: 20,
                      // wrap the checkbox in order to resize it
                      child: Transform.scale(
                        scale: 1.4,
                        child: Checkbox(
                          shape: const CircleBorder(),
                          activeColor: Colors.white,
                          checkColor: themeData.scaffoldBackgroundColor,
                          value: todo.done,
                          onChanged: (value) {
                            if (value != null) {
                              BlocProvider.of<ControllerBloc>(context)
                                  .add(UpdateTodoEvent(
                                todo: todo,
                                done: value,
                              ));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

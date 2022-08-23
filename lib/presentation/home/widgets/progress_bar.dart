import 'package:flutter/material.dart';
import 'package:todo/domain/todo/entities/todo.dart';
import 'package:todo/presentation/home/widgets/progress_bar_painter.dart';

class ProgressBar extends StatelessWidget {
  final List<Todo> todos;
  const ProgressBar({Key? key, required this.todos}) : super(key: key);

  // better create new use case for this function
  double _getDoneTodoPercentage({required List<Todo> todos}) {
    int done = 0;

    for (var todo in todos) {
      if (todo.done) {
        done++;
      }
    }

    double percent = (1 / todos.length) * done;
    return percent;
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(10);
    final themeData = Theme.of(context);

    return Material(
      elevation: 16,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: themeData.appBarTheme.backgroundColor,
          borderRadius: radius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Todos Progress",
                style: themeData.textTheme.headline1!.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Center(
                      child: CustomPaint(
                        painter: ProgressPainter(
                          barHeight: 25,
                          barWidth: constraints.maxWidth,
                          donePercent: _getDoneTodoPercentage(todos: todos),
                          backgroundColor: Colors.grey,
                          percentageColor: Colors.tealAccent,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

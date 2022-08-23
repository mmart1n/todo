part of 'todo_form_bloc.dart';

@immutable
abstract class TodoFormEvent {}

class InitializeTodoDetailPage extends TodoFormEvent {
  final Todo? todo;
  InitializeTodoDetailPage({required this.todo});
}

class ColorChangedEvent extends TodoFormEvent {
  final Color color;
  ColorChangedEvent({required this.color});
}

class SavePressedEvent extends TodoFormEvent {
  final String? title;
  final String? body;

  SavePressedEvent({required this.title, required this.body});
}

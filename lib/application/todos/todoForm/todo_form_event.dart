part of 'todo_form_bloc.dart';

@immutable
abstract class TodoFormEvent {}

class InitializeTodoDetailPage extends TodoFormEvent {
  final Todo? todo;
  InitializeTodoDetailPage({required this.todo});
}

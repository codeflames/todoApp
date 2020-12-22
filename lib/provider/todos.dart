import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      title: 'Walk the dog',
      createdTime: DateTime.now(),
      isDone: false,
    ),
    Todo(
      title: 'Go to the Gym',
      description: 'Workout properly',
      createdTime: DateTime.now(),
      isDone: false,
    ),
  ];

  // List<Todo> get todos {
  //   return _todos.where((todo) {
  //     return todo.isDone == false;
  //   }).toList();
  // }

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted {
    return _todos.where((element) => element.isDone == true).toList();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}

import 'package:flutter/widgets.dart';

class Todofield {
  static const createdTime = 'createdTime';
}

class Todo {
  String title;
  String description;
  bool isDone;
  DateTime createdTime;
  String id;

  Todo(
      {@required this.title,
      this.description = '',
      this.isDone = false,
      @required this.createdTime,
      this.id});
}

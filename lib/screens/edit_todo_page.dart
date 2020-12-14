import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widget/todo_form_widget.dart';

class EditTodoPAge extends StatefulWidget {
  final Todo todo;

  const EditTodoPAge({Key key, this.todo}) : super(key: key);
  @override
  _EditTodoPAgeState createState() => _EditTodoPAgeState();
}

class _EditTodoPAgeState extends State<EditTodoPAge> {
  String title;
  String description;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: TodoFormwidget(
          title: title,
          description: description,
          onChangedTitle: (title) => setState(() => this.title = title),
          onchangedDesription: (description) =>
              setState(() => this.description = description),
          onSavedTodo: () {},
        ),
      ),
    );
  }
}

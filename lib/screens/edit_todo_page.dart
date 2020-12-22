import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/todo_form_widget.dart';

class EditTodoPAge extends StatefulWidget {
  final Todo todo;

  const EditTodoPAge({Key key, this.todo}) : super(key: key);
  @override
  _EditTodoPAgeState createState() => _EditTodoPAgeState();
}

class _EditTodoPAgeState extends State<EditTodoPAge> {
  final _formKey = GlobalKey<FormState>();
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              final provider =
                  Provider.of<TodosProvider>(context, listen: false);
              provider.removeTodo(widget.todo);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: TodoFormwidget(
            title: title,
            description: description,
            onChangedTitle: (title) => setState(() => this.title = title),
            onchangedDesription: (description) =>
                setState(() => this.description = description),
            onSavedTodo: () {
              final isValid = _formKey.currentState.validate();

              if (!isValid) {
                return;
              } else {
                // final todo = Todo(
                //   id: DateTime.now().toString(),
                //   title: title,
                //   description: description,
                //   createdTime: DateTime.now(),
                // );
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.updateTodo(widget.todo, title, description);

                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ),
    );
  }
}

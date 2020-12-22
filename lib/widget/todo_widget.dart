import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/screens/edit_todo_page.dart';
import 'package:todo_app/utils.dart';

import '../model/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key key, this.todo}) : super(key: key);

  Widget buildTodo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        editTodo(context, todo);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: todo.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                final isDone = provider.toggleTodoStatus(todo);

                Utils.showSnackBar(context,
                    isDone ? 'Task completed' : 'Task marked incomplete');
              },
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  //if (todo.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todo.description == null ? '' : todo.description,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(todo.id),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: () {
              editTodo(context, todo);
            },
            caption: 'Edit',
            icon: Icons.edit,
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            onTap: () => deleteTodo(context, todo),
            caption: 'Delete',
            icon: Icons.delete,
          )
        ],
        child: buildTodo(context),
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTodoPAge(
          todo: todo,
        ),
      ),
    );
  }
}

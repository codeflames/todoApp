import 'package:flutter/material.dart';

class TodoFormwidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onchangedDesription;
  final VoidCallback onSavedTodo;

  const TodoFormwidget(
      {Key key,
      this.title = '',
      this.description = '',
      @required this.onChangedTitle,
      @required this.onchangedDesription,
      @required this.onSavedTodo})
      : super(key: key);

  Widget buildTitle() {
    return TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Title',
      ),
      maxLines: 1,
      initialValue: title,
      onChanged: onChangedTitle,
      validator: (title) {
        if (title.isEmpty) {
          return 'the title can not be empty';
        }
        return null;
      },
    );
  }

  Widget buildDescription() {
    return TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Description',
      ),
      maxLines: 3,
      initialValue: description,
      onChanged: onchangedDesription,
    );
  }

  Widget buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
        ),
        onPressed: onSavedTodo,
        child: Text('Save'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          SizedBox(
            height: 8,
          ),
          buildDescription(),
          SizedBox(
            height: 32,
          ),
          buildButton(),
        ],
      ),
    );
  }
}

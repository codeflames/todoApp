import 'package:flutter/material.dart';
import 'package:todo_app/widget/todo_list_widget.dart';

import '../widget/add_todo_dialog.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      Container(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black54,
        onPressed: () {
          return showDialog(
            context: context,
            child: AddTodoDialogWidget(),
            barrierDismissible: false,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'Todos'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
        ],
      ),
    );
  }
}

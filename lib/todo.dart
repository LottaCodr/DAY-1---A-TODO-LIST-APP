import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  const Todolist({Key? key}) : super(key: key);

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  List<String> toDoItems = [];

  void _addTodo(String task){
    if (task.isNotEmpty){
      setState(() {
        toDoItems.add(task);
      });
    }
  }

  void _removeTodo(int index){
    setState(() {
      toDoItems.removeAt(index);
    });
  }

Widget _buildTodoItem(String text, int index) {
    return ListTile(
      title: Text(text),
      onTap: () {
        _removeTodo(index);
      },
    );
}

Widget _buildTodolist(){
    return ListView.builder(
        itemBuilder: (context, index){
          if(index < toDoItems.length) {
            return _buildTodoItem(toDoItems[index], index);
          }
          return Container();
        },
    );
}

void _pushToScreen(){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("What's your new task?"),
            ),

            body: TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addTodo(val);
                Navigator.pop(context);
              },

              decoration: const InputDecoration(
                hintText: "My task is...",
                contentPadding: EdgeInsets.all(16.0)

              )
              ,
            ),
          );
        }));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Lotta TODO App",
          style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        elevation: 0,

      ),

      body: _buildTodolist(),
            floatingActionButton: FloatingActionButton(
                onPressed: _pushToScreen,
                tooltip: "Add Task",
              child: const Icon(Icons.add),
            ),

    );
  }
}

import 'package:flutter/material.dart';
import 'todo.dart';
import 'todo_tile.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // Using the Todo class instead of Maps
  final List<Todo> _todos = [];
  final TextEditingController _textController = TextEditingController();

  void _addTodoItem(String taskName) {
    if (taskName.isNotEmpty) {
      setState(() {
        _todos.add(Todo(name: taskName));
      });
      _textController.clear();
    }
    Navigator.of(context).pop();
  }

  void _handleTodoChange(int index) {
    setState(() {
      _todos[index].isChecked = !_todos[index].isChecked;
    });
  }

  void _deleteTodoItem(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'Create a new task',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(hintText: "Create task here"),
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white), // Added to make input text visible
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () => _addTodoItem(_textController.text),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text('Add', style: TextStyle(color: Colors.blueGrey)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Planner', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: _todos.isEmpty
          ? const Center(child: Text('No tasks yet! Tap + to add one.'))
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  todo: _todos[index],
                  onChanged: () => _handleTodoChange(index),
                  onDelete: () => _deleteTodoItem(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

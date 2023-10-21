import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Testing todo application',
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
  ),
  debugShowCheckedModeBanner: false,
  home: const MyHomePage(),
));

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _todos = ['item1', 'item2', 'item2'];

  void _addTodos() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String _todo = '';
        return AlertDialog(
          title: const Text('Todo task'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'add your todos',
            ),
            onChanged: (value) {
              _todo = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _todos.add(_todo);
                });
                Navigator.of(context).pop();
              },
              child: const Text('submit'),
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
        title: const Text('ToDo App'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            final newTodo = _todos[index];
            return ListTile(
              title: Text(newTodo),
              subtitle: Text('You have added the new $newTodo'),
              onTap: () {
                setState(() {
                  _todos.removeAt(index);
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodos,
        child: const Icon(Icons.add),
      ),
    );
  }
}


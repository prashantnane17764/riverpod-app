import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AddTodo extends StatefulHookConsumerWidget {
  const AddTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  final List<String> tasks = [];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     tasks.insert(index, controller)
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final String value = ref.watch(greetingsProvider);
    final TextEditingController _nameController =
        ref.watch(nameControllerProvider);
    final TextEditingController _ageController =
        ref.watch(ageControllerProvider);
    final TextEditingController _taskController =
        ref.watch(taskControllerProvider);
    // final listNotifier = ref.watch(listProvider);
    //       final myList = listNotifier.state;
    return Padding(
      padding: const EdgeInsets.all(80.0),
      child: Column(
        children: [
          Container(
            child: Text(value),
          ),
          SizedBox(
            height: 15,
          ),
          Form(
              child: Column(
            children: [
              _textformfield(_nameController, 'Name'),
              SizedBox(
                height: 10,
              ),
              _textformfield(_ageController, 'Age'),
              SizedBox(
                height: 10,
              ),
              _textformfield(_taskController, 'Task'),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    // listNotifier.addItem('New Item');
                    ref.read(nameProvider.notifier).state =
                        _nameController.text;
                    ref.read(ageProvider.notifier).state = _ageController.text;
                    ref.read(taskProvider.notifier).state =
                        _taskController.text;
                  },
                  child: Text('Add'))
            ],
          ))
        ],
      ),
    );
  }

  Widget _textformfield(TextEditingController _controller, String label) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}

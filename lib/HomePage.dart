import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:river_pod_app/pdf/pdfPreview.dart';

import './add_todo.dart';
import './todo_list.dart';
import './main.dart';

class HomePage extends StatefulHookConsumerWidget {
  HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
  int length = 0;
}

int _selectedIndex = 0;

List<Widget> _widgets = <Widget>[
  AddTodo(),
  TodoList(),
  PdfPreviewPage(),
];

class _HomePageState extends ConsumerState<HomePage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String value = ref.watch(greetingsProvider);
    return Scaffold(
      body: Center(
          child: Container(
        child: _widgets.elementAt(_selectedIndex),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: "Delete",
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

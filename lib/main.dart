import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:river_pod_app/HomePage.dart';
import 'package:riverpod/riverpod.dart';

final greetingsProvider = StateProvider<String>((ref) {
  return "Welcome to Todo App";
});

final nameControllerProvider = StateProvider<TextEditingController>((ref) {
  final _controller = TextEditingController();
  return _controller;
});
final ageControllerProvider = StateProvider<TextEditingController>((ref) {
  final _controller = TextEditingController();
  return _controller;
});
final taskControllerProvider = StateProvider<TextEditingController>((ref) {
  final _controller = TextEditingController();
  return _controller;
});

final nameProvider = StateProvider<String>((ref) {
  String _name = '';
  return _name;
});
final ageProvider = StateProvider<String>((ref) {
  String _age = '';
  return _age;
});
final taskProvider = StateProvider<String>((ref) {
  String _task = '';
  return _task;
});

class listNotifier extends StateNotifier<List<String>> {
  listNotifier(List<String> state) : super(state);

  void addItem(String item) {
    state = [...state, item];
  }
}

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Satoshi',
      ),
      home: HomePage(),
    );
  }
}

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/router/routes.dart';
import 'package:study_management_app/data/sources/local/todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  // await database
  //     .into(database.category)
  //     .insert(CategoryCompanion.insert(name: '일상'));
  // await database
  //     .into(database.category)
  //     .insert(CategoryCompanion.insert(name: '공부'));
  // await database
  //     .into(database.category)
  //     .insert(CategoryCompanion.insert(name: '프로젝트'));
  //
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: '물 마시기', category: '일상', startTime: DateTime.now()));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: '3km 뛰기',
  //     category: '일상',
  //     startTime: DateTime.now().add(Duration(hours: 1))));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: '공부관리앱 프로젝트',
  //     category: '프로젝트',
  //     startTime: DateTime.now().add(Duration(days: 2))));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: 'Riverpod 공부',
  //     category: '공부',
  //     startTime: DateTime.now().add(Duration(days: 2))));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: 'Riverpod 공부',
  //     category: '공부',
  //     startTime: DateTime.now().add(Duration(days: 2))));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: 'Riverpod 공부',
  //     category: '공부',
  //     startTime: DateTime.now().add(Duration(days: 2))));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: 'Riverpod 공부',
  //     category: '공부',
  //     startTime: DateTime.now().add(Duration(days: 2))));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: 'Riverpod 공부',
  //     category: '공부',
  //     startTime: DateTime.now().add(Duration(days: 2))));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: 'Riverpod 공부',
  //     category: '공부',
  //     startTime: DateTime.now().add(Duration(days: 2))));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: 'Riverpod 공부',
  //     category: '공부',
  //     startTime: DateTime.now().add(Duration(days: 2))));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: 'Riverpod 공부',
  //     category: '공부',
  //     startTime: DateTime.now().add(Duration(days: 2))));
  // await database.into(database.toDoItem).insert(ToDoItemCompanion.insert(
  //     title: 'Riverpod 공부',
  //     category: '공부',
  //     startTime: DateTime.now().add(Duration(days: 2))));

  // await database.delete(database.toDoItem).go();
  // await database.delete(database.category).go();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Study Manegement APP',
      routerConfig: router,
      // theme: ThemeData(
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // useMaterial3: true,
      // ),
    );
  }
}

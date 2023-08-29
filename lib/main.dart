import 'package:bloc_todo_app/application/app/basic_ui.dart';
import 'package:bloc_todo_app/data/repository/todo_repository_mock.dart';
import 'package:bloc_todo_app/domain/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    RepositoryProvider<ToDoRepository>(
      create: (context) => TodoRepositoryMock(),
      child: const BasicApps(),
    ),
  );
}

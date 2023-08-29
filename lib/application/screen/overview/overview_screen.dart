import 'package:bloc_todo_app/application/screen/overview/view_state/todo_overview_error.dart';
import 'package:bloc_todo_app/application/screen/overview/view_state/todo_overview_loaded.dart';
import 'package:bloc_todo_app/application/screen/overview/view_state/todo_overview_loading.dart';
import 'package:bloc_todo_app/domain/use_case/load_todo_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/screen_config.dart';
import 'cubit/todo_overview_cubit.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  static const screenConfig = ScreenConfig(
    icon: Icons.work_history,
    name: 'overview',
    child: OverviewPageProvider(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoOverviewCubit, TodoOverviewState>(
      builder: (context, state) {
        if (state is TodoOverviewStateLoading) {
          return const Center(child: TodoOverviewLoading());
        } else if (state is TodoOverviewStateLoaded) {
          return TodoOverviewLoaded(collections: state.toDoCollections);
        } else {
          return const TodoOverviewError();
        }
      },
    );
  }
}

class OverviewPageProvider extends StatelessWidget {
  const OverviewPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoOverviewCubit(
        loadToDoCollections: LoadToDoCollections(
          toDoRepository: RepositoryProvider.of(context),
        ),
      )..readCollection(),
      child: const OverviewScreen(),
    );
  }
}

import 'package:bloc_todo_app/domain/entities/todo_collection.dart';
import 'package:flutter/material.dart';

class TodoOverviewLoaded extends StatelessWidget {
  const TodoOverviewLoaded({super.key, required this.collections});

  final List<TodoCollections> collections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final item = collections[index];
        final colorScheme = Theme.of(context).colorScheme;
        return ListTile(
          tileColor: colorScheme.surface,
          selectedColor: item.colors.color,
          iconColor: item.colors.color,
          selectedTileColor: colorScheme.surfaceVariant,
          onTap: () => debugPrint('onTap: ${item.titleName}'),
          title: Text(item.titleName),
          leading: const Icon(Icons.circle),
        );
      },
    );
  }
}

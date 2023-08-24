import 'collection_id.dart';
import 'todo_colors.dart';

class TodoCollections {
  final CollectionId id;
  final TodoColors colors;
  final String titleName;

  const TodoCollections({
    required this.id,
    required this.colors,
    required this.titleName,
  });

  factory TodoCollections.empty() {
    return TodoCollections(
      id: CollectionId(),
      colors: TodoColors.empty(),
      titleName: '',
    );
  }
}

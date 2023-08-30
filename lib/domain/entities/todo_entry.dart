import 'collection_id.dart';

class TodoEntry {
  final EntryId id;
  final bool isDone;
  final String description;

  TodoEntry({
    required this.id,
    required this.isDone,
    required this.description,
  });

  factory TodoEntry.empty() {
    return TodoEntry(
      id: EntryId(),
      isDone: false,
      description: '',
    );
  }
}

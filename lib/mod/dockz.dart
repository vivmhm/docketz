class Dockz {
  final int id;
  final int taskId;
  final String title;
  final int isDone;
  Dockz({this.id, this.taskId, this.title, this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskId': taskId,
      'title': title,
      'isDone': isDone,
    };
  }
}
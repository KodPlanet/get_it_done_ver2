class Item {
  final String title;
  bool isDone;

  Item({this.title, this.isDone = false});
  Item.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        isDone = map['isDone'];

  void toggleStatus() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}

export 'page.dart' show OrderListPage;

class Choice {
  const Choice({this.title, this.count, this.status});

  final String title;
  final int count;
  final int status;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '今预到', count: 10, status: 1),
  const Choice(title: '今预离', count: 9, status: 2),
  const Choice(title: '待分房', count: 8, status: 3),
  const Choice(title: '待确认', count: 4, status: 4),
  const Choice(title: '全部', count: 102, status: 0),
];

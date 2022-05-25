class Stack<E> {
  final _list = <E>[];

  // 1개 넣기
  void push(E value) => _list.add(value);

  // 1개 제거
  E pop() => _list.removeLast();

  // 모두 제거
  void popAll() => _list.clear();

  // 최상단 item
  E get top => _list.last;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();
}
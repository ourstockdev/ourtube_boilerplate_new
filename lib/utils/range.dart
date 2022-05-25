Iterable<int> range(int start, int end) sync* {
  for (int i = start; i < end; ++i) {
    yield i;
  }
}

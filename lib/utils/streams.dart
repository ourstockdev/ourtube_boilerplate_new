class Streams {
  static Stream<Duration> timer(Duration interval, {int maxCount = 1}) async* {
    int i = 0;
    do {
      yield interval * i++;
      await Future.delayed(interval);
    } while (i != maxCount);
  }
}

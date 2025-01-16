class Ticker {
  Ticker();
  Stream<int> tick(int tick) {
    Stream<int> time =
        Stream.periodic(Duration(seconds: 1), (x) => tick - x - 1).take(tick);
    return time;
  }
}

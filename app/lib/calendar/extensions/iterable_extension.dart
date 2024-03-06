extension IterableExt<T> on Iterable<T> {
  T? firstWhereOrNull(
    bool Function(T element) check,
  ) {
    for (T element in this) {
      if (check(element)) return element;
    }
    return null;
  }

  List<R> mapList<R, S>(
    R Function(T) builder,
  ) {
    return map((e) => builder(e)).toList();
  }
}

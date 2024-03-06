extension ListExt<T> on List<T> {
  List<List<T>> splitInSubLists(int length) {
    final List<List<T>> list = [];
    for (int i = 0; i < this.length; i += length) {
      int end = (i + length < this.length) ? i + length : this.length;
      list.add(sublist(i, end));
    }
    return list;
  }
}

extension ExtensionOnIterables on Iterable {
  T getMiddleElement<T>() => elementAt((length / 2).floor());
}

extension ExtensionOnLists on List {
  T getMiddleElement<T>() => elementAt((length / 2).floor());
}

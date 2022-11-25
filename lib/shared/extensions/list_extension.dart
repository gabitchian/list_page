extension ListExtension<T> on List<T> {
  List<List<T>> chunk(int numberOfElements) {
    List<List<T>> mappedElements = [];

    int rowsLength = (length / numberOfElements).ceil();

    for (int i = 0; i < rowsLength; i++) {
      int finalElementPosition =
          length >= numberOfElements ? numberOfElements : length;
      List<T> aux = getRange(0, finalElementPosition).toList();
      mappedElements.add(aux);
      removeRange(0, finalElementPosition);
    }

    return mappedElements;
  }
}

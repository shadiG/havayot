extension ListExtension<D> on List<D> {
  List<D> alternate(int size) {
    return List.generate(
        size, (index) => elementAt((index >= (length - 1)) ? index % length : index));
  }
}

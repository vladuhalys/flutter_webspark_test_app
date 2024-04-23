extension NullOrEmptyExtension on String? {
  bool isNullOrEmpty() {
    if (this == null) {
      return true;
    } else {
      return this!.isEmpty;
    }
  }

  bool isNotNullOrEmpty() {
    return !isNullOrEmpty();
  }
}

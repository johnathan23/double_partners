extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeFirstLetterOfEachWord() {
    if (isEmpty) return this;

    return toLowerCase().split(' ').map((word) => word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '').join(' ');
  }

  String normalize() =>
      trim().toLowerCase().replaceAll(RegExp(r'\s+'), ' ');
}

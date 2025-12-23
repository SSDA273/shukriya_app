extension StringExtension on String {
  String capitalize() {
    if (this == "") {
      return this;
    } else {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
  }

  String maskNumber(int length) {
    if (this == "") {
      return this;
    } else {
      return "+${substring(0,3)} ${substring(3,length).replaceAll(
          RegExp(r'.(?=.{4})'), '*')}";
    }
  }
}

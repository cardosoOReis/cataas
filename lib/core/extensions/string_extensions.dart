extension Capitalize on String {
  String capitalize() => this[0].toUpperCase() + substring(1);
  String capitalizeName() =>
      split(' ').map((name) => name.capitalize()).join(' ');
}

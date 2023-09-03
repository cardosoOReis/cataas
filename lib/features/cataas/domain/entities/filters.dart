enum Filters {
  none,
  blur,
  mono,
  sepia,
  negative,
  paint,
  pixel;

  String? get value => switch (this) {
        Filters.none => null,
        _ => name,
      };
}

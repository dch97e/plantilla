import 'dart:ui';

extension CoreColorExtensions on Color {
  Color setOpacity(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0, 'Value must be between 0 and 1');

    return withAlpha((255.0 * opacity).round());
  }
}

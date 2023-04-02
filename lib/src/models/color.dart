import 'dart:math';

class Color {
  int r;
  int g;
  int b;
  int a;

  Color([
    this.r = 0,
    this.g = 0,
    this.b = 0,
    this.a = 255,
  ]);
  static Color black = Color(0, 0, 0, 255);
  static Color white = Color(255, 255, 255, 255);
  static Color red = Color(255, 0, 0, 255);
  static Color blue = Color(0, 0, 255, 255);

  // "trick" HSL which is based on YUV space.
  // http://www.quasimondo.com/archives/000696.php
  factory Color.newHSL(double hue, double sat, double lum) {
    var u = cos(hue) * sat, v = sin(hue) * sat;
    var r = lum + 1.139837 * v;
    var g = lum - 0.394651 * u - 0.580598 * v;
    var b = lum + 2.032110 * u;
    return Color((r * 255) as int, (g * 255) as int, (b * 255) as int, 255);
  }

  static int lerp(num a, num b, num t) {
    return ((a * (1.0 - t)) + (b * t) as int);
  }

  // Lerps between colors "color1" and "color2".
  factory Color.lerpRGBA(Color color1, Color color2, t) {
    var newR = lerp(color1.r, color2.r, t);
    var newG = lerp(color1.g, color2.g, t);
    var newB = lerp(color1.b, color2.b, t);
    var newA = lerp(color1.a, color2.a, t);
    return Color(newR, newG, newB, newA);
  }

  // "Inverse lerp".
  // Given bounds [a, b], tell me the "time" of value "v"
  // between those two values, where 0 is a, and 1 is b.
  static num inverseLerp(num a, num b, num v) {
    return (v - a) / (b - a);
  }
}

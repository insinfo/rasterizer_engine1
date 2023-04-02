import 'package:rasterizer_engine1/rasterizer_engine1.dart';

class ColorF {
  final double r;
  final double g;
  final double b;
  
  ColorF(this.r, this.g, this.b);
  
  ColorF operator *(double scalar) => ColorF(r * scalar, g * scalar, b * scalar);
  
  ColorF operator +(ColorF other) => ColorF(r + other.r, g + other.g, b + other.b);
  
  @override
  String toString() => '($r, $g, $b)';

  Color toColor() =>Color(r.round(),g.round(),b.round());
}
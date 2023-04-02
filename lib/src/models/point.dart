/// Points are the fundamental two-dimensional building block for geometric types
class Point {
  final int x;
  final int y;
  Point(this.x, this.y);

  @override
  String toString() => '($x, $y)';
}

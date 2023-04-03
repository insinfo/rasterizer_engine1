/// Points flout are the fundamental two-dimensional building block for geometric types
class PointF {
  final double x;
  final double y;
  
  PointF(this.x, this.y);
  
  @override
  String toString() => '($x, $y)';
}
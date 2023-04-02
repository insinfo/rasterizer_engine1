// import 'dart:math' as math ;

import 'dart:math';

import 'package:rasterizer_engine1/rasterizer_engine1.dart';
import 'package:rasterizer_engine1/src/models/pointf.dart';

import 'models/colorf.dart';

const int BYTES_PER_PIXEL = 4;

int indexForPixelLocation(ImageData imageData, x, y) {
  return ((y * imageData.width + x) * BYTES_PER_PIXEL).floor();
}

Point pixelLocationForIndex(ImageData imageData, int idx) {
  var pixelIdx = (idx / BYTES_PER_PIXEL).floor();
  var y = (pixelIdx / imageData.width).floor();
  var x = pixelIdx % imageData.width;
  return Point(x, y);
}

void fillPixel(ImageData imageData, num x, num y, Color color) {
  // Guard against out-of-bound writes.
  if (x < 0 || x >= imageData.width || y < 0 || y >= imageData.height) {
    return;
  }

  var idx = indexForPixelLocation(imageData, x, y);
  imageData.data[idx + 0] = color.r;
  imageData.data[idx + 1] = color.g;
  imageData.data[idx + 2] = color.b;
  imageData.data[idx + 3] = color.a; // Alpha
}



void trapezoidRasterization(List<PointF> vertices, ImageData imageData) {
  // Sort vertices by y-coordinate
  vertices.sort((a, b) => a.y.compareTo(b.y));

  // Find the top and bottom y-coordinates
  final topY = vertices.first.y.ceilToDouble();
  final bottomY = vertices.last.y.floorToDouble();

  // Iterate over each scanline
  for (var y = topY; y <= bottomY; y++) {
    // Find the trapezoids for this scanline
    final trapezoids = <List<PointF>>[];
    var prevVertex = vertices.first;
    for (final vertex in vertices.skip(1)) {
      if (vertex.y == y) {
        // If the vertex lies on the scanline, add a horizontal trapezoid
        trapezoids.add([
          PointF(prevVertex.x, y),
          PointF(vertex.x, y),
        ]);
      } else if (vertex.y > y) {
        // If the vertex is above the scanline, add a trapezoid
        final slope = (vertex.x - prevVertex.x) / (vertex.y - prevVertex.y);
        final x = prevVertex.x + slope * (y - prevVertex.y);
        trapezoids.add([
          PointF(prevVertex.x, y),
          PointF(x, y),
          PointF(x, vertex.y),
        ]);
        prevVertex = vertex;
      } else {
        // If the vertex is below the scanline, skip it
        prevVertex = vertex;
      }
    }

    // Draw the trapezoids for this scanline
    for (final trapezoid in trapezoids) {
      //print(trapezoid);
      var first = trapezoid.first;
      var last = trapezoid.last;
      final left = first.x != double.negativeInfinity ? first.x.round() : 0;
      final right = last.x != double.negativeInfinity ? last.x.round() : 0;

      for (var x = left; x <= right; x++) {
        // Draw pixel at (x, y)
        //print('($x, $y)');
        fillPixel(imageData, x, y, Color.red);
      }
    }
  }
}


void trapezoidRasterization2(List<PointF> vertices, ColorF color, double lineWidth, ImageData imageData) {
  // Sort vertices by y-coordinate
  vertices.sort((a, b) => a.y.compareTo(b.y));
  
  // Find the top and bottom y-coordinates
  final  topY = vertices.first.y.ceilToDouble();
  final  bottomY = vertices.last.y.floorToDouble();
  
  // Iterate over each scanline
  for (var y = topY; y <= bottomY; y++) {
    // Find the trapezoids for this scanline
    final  trapezoids = <List<PointF>>[];
    var prevVertex = vertices.first;
    for (final vertex in vertices.skip(1)) {
      if (vertex.y == y) {
        // If the vertex lies on the scanline, add a horizontal trapezoid
        trapezoids.add([
          PointF(prevVertex.x, y),
          PointF(vertex.x, y),
        ]);
      } else if (vertex.y > y) {
        // If the vertex is above the scanline, add a trapezoid
        final double slope = (vertex.x - prevVertex.x) / (vertex.y - prevVertex.y);
        final double x = prevVertex.x + slope * (y - prevVertex.y);
        trapezoids.add([
          PointF(prevVertex.x, y),
          PointF(x, y),
          PointF(x, vertex.y),
        ]);
        prevVertex = vertex;
      } else {
        // If the vertex is below the scanline, skip it
        prevVertex = vertex;
      }
    }
    
    // Draw the trapezoids for this scanline
    for (final trapezoid in trapezoids) {
      final left = trapezoid.first.x.round();
      final right = trapezoid.last.x.round();
      for (var x = left; x <= right; x++) {
        // Compute the coverage of this pixel
        final double leftEdge = max(left.toDouble(), x - 0.5 - lineWidth / 2);
        final double rightEdge = min(right.toDouble(), x + 0.5 + lineWidth / 2);
        final double alpha = min(1.0, (rightEdge - leftEdge) / lineWidth);
        
        // Blend the pixel color with the background color using the coverage
        final backgroundColor = ColorF(1, 1, 1); // Use white background color for example
        final blendedColor = color * alpha + backgroundColor * (1 - alpha);
        
        // Draw pixel at (x, y) with the blended color
        //rint('($x, $y): $blendedColor');
        fillPixel(imageData,x,y,blendedColor.toColor());
      }
    }
  }
}
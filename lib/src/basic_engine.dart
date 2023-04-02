// import 'dart:math' as math ;

import 'package:rasterizer_engine1/rasterizer_engine1.dart';

const int BYTES_PER_PIXEL = 4;

int indexForPixelLocation(ImageData imageData, x, y) {
  return (y * imageData.width + x) * BYTES_PER_PIXEL;
}

Point pixelLocationForIndex(ImageData imageData, int idx) {
  var pixelIdx = (idx / BYTES_PER_PIXEL).floor();
  var y = (pixelIdx / imageData.width).floor();
  var x = pixelIdx % imageData.width;
  return Point(x, y);
}

void fillPixel(ImageData imageData, x, y, rgb) {
  // Guard against out-of-bound writes.
  if (x < 0 || x >= imageData.width || y < 0 || y >= imageData.height) {
    return;
  }

  var idx = indexForPixelLocation(imageData, x, y);
  imageData.data[idx + 0] = rgb.r;
  imageData.data[idx + 1] = rgb.g;
  imageData.data[idx + 2] = rgb.b;
  imageData.data[idx + 3] = 255; // Alpha
}


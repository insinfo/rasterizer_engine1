import 'dart:typed_data';

import 'package:rasterizer_engine1/src/models/color.dart';

class ImageData {
  ///A Uint8ClampedArray representing a one-dimensional array containing the data in the RGBA order, with integer values between 0 and 255 (inclusive). The order goes by rows from the top-left pixel to the bottom-right.
  final List<int> data;

  /// A string indicating the color space of the image data.
  final String colorSpace;

  /// An unsigned long representing the actual height, in pixels, of the ImageData.
  final int height;

  /// An unsigned long representing the actual width, in pixels, of the ImageData.
  final int width;

  ImageData(
      {required this.data,
      this.colorSpace = 'sRGB',
      required this.height,
      required this.width}) {
    if (data.length != (4 * width) && data.length != (4 * width * height)) {
      throw Exception(
          'IndexSizeError  array length is not a multiple of (4 * width) or (4 * width * height)');
    }
  }

  factory ImageData.fromWH(int width, int height, {Color? color}) {
    var limit = width * height * 4;
    var arr = List.filled(limit, 0);
    var c = color ?? Color.black;
    // Fill the array with  RGBA values
    for (var i = 0; i < limit; i += 4) {
      arr[i + 0] = c.r; // R value
      arr[i + 1] = c.g; // G value
      arr[i + 2] = c.b; // B value
      arr[i + 3] = c.a; // A value
    }

    return ImageData(data: arr, width: width, height: height);
  }

  ByteBuffer get bytes => Uint8ClampedList.fromList(data).buffer;
}

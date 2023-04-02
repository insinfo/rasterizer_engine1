import 'package:rasterizer_engine1/rasterizer_engine1.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:rasterizer_engine1/src/basic_engine.dart';
import 'package:rasterizer_engine1/src/models/colorf.dart';
import 'package:rasterizer_engine1/src/models/pointf.dart';

void main(List<String> arguments) async {
// Initialize a new ImageData object
  var imageData = ImageData.fromWH(600, 400, color: Color.white);

 
  final vertices = [
    PointF(75, 50),
    PointF(100, 75),
    PointF(100, 25),
  ];
  trapezoidRasterization2(vertices, ColorF(255, 0, 0), 1, imageData);

  final image = img.Image.fromBytes(
    width: imageData.width,
    height: imageData.height,
    bytes: imageData.bytes,
    order: img.ChannelOrder.rgba,
    numChannels: 4,
  );
  final png = img.encodePng(image);
  await File('image.png').writeAsBytes(png);
}

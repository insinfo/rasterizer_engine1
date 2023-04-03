
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:rasterizer_engine1/src/aula1/models/color.dart';
import 'package:rasterizer_engine1/src/aula1/models/colorf.dart';
import 'package:rasterizer_engine1/src/aula1/basic_engine.dart';
import 'package:rasterizer_engine1/src/aula1/models/image_data.dart';
import 'package:rasterizer_engine1/src/aula1/models/pointf.dart';


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

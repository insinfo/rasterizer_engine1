import 'package:rasterizer_engine1/rasterizer_engine1.dart';
import 'dart:io';
import 'package:image/image.dart' as img;

void main(List<String> arguments) async {
// Initialize a new ImageData object
  var imageData = ImageData.fromWH(20, 20, color: Color.red);

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

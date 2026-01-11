import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/services.dart';

Future<ui.Image> loadAndCropImage(String assetPath, double cropRatio) async {
  final ByteData data = await rootBundle.load(assetPath);
  final codec = await ui.instantiateImageCodec(
    data.buffer.asUint8List(),
  );
  final frame = await codec.getNextFrame();
  final image = frame.image;

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);

  final paint = Paint();
  final cropHeight = image.height * (1 - cropRatio); // crop bottom cropRatio
  canvas.drawImageRect(
    image,
    Rect.fromLTWH(0, 0, image.width.toDouble(), cropHeight),
    Rect.fromLTWH(0, 0, image.width.toDouble(), cropHeight),
    paint,
  );

  final croppedImage = await recorder
      .endRecording()
      .toImage(image.width, cropHeight.toInt());
  return croppedImage;
}

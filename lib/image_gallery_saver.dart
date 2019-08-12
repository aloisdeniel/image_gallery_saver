import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class ImageGallerySaver {
  static const MethodChannel _channel =
      const MethodChannel('image_gallery_saver');

  /// Save PNG [imageBytes] to the local device media gallery.
  static Future save(Uint8List imageBytes) {
    assert(imageBytes != null, "Bytes are null");
    return _channel.invokeMethod('saveImageToGallery', imageBytes);
  }

  /// Save the PNG image located at [imagePath] to the local device media gallery.
  static Future saveFile(String imagePath) async {
    assert(imagePath != null, "Empty file path");
    final file = File(imagePath);
    assert(await file.exists(), "The given file doesn't exist");
    return await _channel.invokeMethod('saveFileToGallery', imagePath);
  }
}

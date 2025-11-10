import 'dart:io';
import 'dart:math';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Image? loadImageFileFromUrl({required String? url}) {
  if (url == null) {
    return null;
  }

  return Image.network(
    url,
    // width: 1200,
    // filterQuality: FilterQuality.medium,
    fit: BoxFit.cover,
  );
}

// Future<XFile> convertImageUrlToXFile(String imageUrl) async {
//
//   var rng = Random();
//
//   Directory tempDir = await getTemporaryDirectory();
//
//   String tempPath = tempDir.path;
//
//   File file = File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');
//
//   http.Response response = await http.get(Uri.parse(imageUrl));
//
//   await file.writeAsBytes(response.bodyBytes);
//   return XFile(file.path);
//
// }
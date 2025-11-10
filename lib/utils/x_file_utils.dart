import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

Future<String> xFileToBlobUrl(XFile file) async {
  final bytes = await file.readAsBytes();
  final blob = html.Blob([bytes], 'video/mp4');
  final url = html.Url.createObjectUrlFromBlob(blob);
  return url;
}




Future<XFile> createXFileFromUrl(String url, {String? name, String? mimeType}) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode != 200) {
    throw Exception('Failed to download file: ${response.statusCode}');
  }

  final bytes = response.bodyBytes;

  return XFile.fromData(
    bytes,
    name: name ?? 'video.mp4',
    mimeType: mimeType ?? 'video/mp4',
  );
}


import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class Downloader {

  Future<File> getFileLocation(String url) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    return new File('$dir/$filename');
  }

  Future<File> getFile(String url) async {
    File file = await this.getFileLocation(url);
    if (await file.exists()) {
      return file;
    }

    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    await file.writeAsBytes(bytes);

    return file;
  }

  Future<void> downloadFileAsync(String url) async {
    File file = await this.getFileLocation(url);

    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();

    consolidateHttpClientResponseBytes(response).then((bytes) {
      file.writeAsBytes(bytes);
    });
  }
}
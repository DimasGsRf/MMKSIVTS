import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:sfid_mobile/app/misc/utils.dart';

class DownloaderMixins {
  download(String url, BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();

    await FlutterDownloader.enqueue(
      url: url,
      savedDir: await Utils.getDownloadPath(context),
      showNotification: true,
      openFileFromNotification: true,
    );
  }
}

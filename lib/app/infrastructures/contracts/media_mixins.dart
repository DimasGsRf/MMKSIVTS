import 'package:flutter/material.dart';
import 'package:mmksi_vts_mobile/app/misc/route_arguments.dart';
import 'package:mmksi_vts_mobile/app/ui/pages/pages.dart';

class MediaMixins {
  void showDetail(
    BuildContext context,
    String type,
    String link,
    String title, {
    bool isDownloadable = false,
    String from = Pages.main,
  }) {
    if (type == "pdf") {
      Navigator.pushNamed(
        context,
        Pages.pdfView,
        arguments: RouteArguments(
          description: link,
          title: title,
          extras: {"is_downloadable": isDownloadable},
        ),
      );
    }

    if (type == "jpg" || type == "jpeg" || type == "png") {
      Navigator.pushNamed(
        context,
        Pages.imageView,
        arguments: RouteArguments(
          description: link,
          title: title,
          extras: {"is_downloadable": isDownloadable},
        ),
      );
    }

    if (type == "mp4") {
      var current = ModalRoute.of(context)?.settings.name;
      Navigator.pushNamed(
        context,
        Pages.videoView,
        arguments: RouteArguments(
          description: link,
          title: title,
          from: current != null ? current : Pages.main,
        ),
      );
    }

    // document
    if (type == "ppt" ||
        type == "pptx" ||
        type == "doc" ||
        type == "docx" ||
        type == "xls" ||
        type == "xlsx") {
      Navigator.pushNamed(
        context,
        Pages.docView,
        arguments: RouteArguments(
          description: link,
          title: title,
          type: type,
          extras: {"is_downloadable": isDownloadable},
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HighlightPicture extends StatelessWidget {
  final String? coverImage, title, description, createdAt, type;
  final AlignmentGeometry titleAlign, descriptionAlign;
  final int? views;
  final double? height;
  final VoidCallback? onPress;
  final TextStyle? descriptionStyle;

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  HighlightPicture(
      {Key? key,
      @required this.coverImage,
      @required this.title,
      this.onPress,
      this.createdAt,
      this.type,
      this.height = 200,
      this.views,
      this.description,
      this.descriptionStyle = const TextStyle(color: Colors.white),
      this.titleAlign = Alignment.topLeft,
      this.descriptionAlign = Alignment.bottomRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        FadeInImage.memoryNetwork(
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          image: coverImage ?? '',
          height: height,
          placeholder: kTransparentImage,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPress,
            child: Container(
              width: double.infinity,
              height: height,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.grey.withOpacity(0.0),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(1.0),
                  ],
                  stops: [0.0, 0.7, 1.0],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  type != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align(
                              alignment: titleAlign,
                              child: Text(
                                type ?? "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Align(
                              alignment: titleAlign,
                              child: Text(
                                title ?? "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        )
                      : Align(
                          alignment: titleAlign,
                          child: Text(
                            title ?? "",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                  description == null
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                createdAt ?? "",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                              Text(
                                "$views views",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      : Align(
                          alignment: descriptionAlign,
                          child:
                              Text(description ?? "", style: descriptionStyle),
                        )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

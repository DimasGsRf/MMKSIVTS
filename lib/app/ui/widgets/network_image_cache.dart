import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageCache extends CachedNetworkImageProvider {
  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  NetworkImageCache(String url) : super(url);
}

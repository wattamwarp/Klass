import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_klass/core/constants/constants.dart';
import '../helper/images.dart';

Widget customNetworkImage(
  String path, {
  BoxFit fit = BoxFit.contain,
  Widget? placeholder,
  double? height,
  double? width,
  Widget? defaultHolder,
}) {
  // assert(path != null);
  if (path.isEmpty) {
    return defaultHolder ??
        Image.asset(
          KImages.appLogo, //TODO: DEFAULT IMAGE USING SVG
          height: height ?? 50,
          width: width ?? 50,
        );
  }
  return CachedNetworkImage(
    fit: fit,
    imageUrl: path,
    placeholderFadeInDuration: const Duration(milliseconds: 500),
    placeholder: placeholder != null
        ? (context, url) => placeholder
        : (context, url) => Container(
              color: Colors.grey[300],
            ),
    errorWidget: (context, url, error) =>
        placeholder ?? const Icon(Icons.error),
    height: height,
    width: width,
  );
}

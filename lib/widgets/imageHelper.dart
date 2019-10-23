import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageHelper {
  static PlaceholderWidgetBuilder placeHolderImageBuilder(Widget widget) {
    return (BuildContext context, String url) {
      return widget;
    };
  }

  static LoadingErrorWidgetBuilder errorImageBuilder(Widget widget) {
    return (BuildContext context, String url, Object error) {
      return widget;
    };
  }

  static Widget placeHolderImage({@required double width, double height}) {
    height ??= width;
    return SizedBox(
      width: width,
      height: height,
      child: CupertinoActivityIndicator(
        radius: min(10, width / 3),
      ),
    );
  }

  static Widget errorImage(
      {@required double width, double height, double size, Color color}) {
    height ??= width;
    return SizedBox(
      width: width,
      height: height,
      child: Icon(
        Icons.error_outline,
        color: color,
        size: size,
      ),
    );
  }
}

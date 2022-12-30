import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:overlay_toast_message/overlay_toast_message.dart' as overlay;

class OverlayToastMessage {
  OverlayToastMessage._();

  static show({
    BuildContext? context,
    Widget? widget,
    Duration? duration,
    Duration? animDuration,
    String? textMessage,
    Decoration? decoration,
    Color? backgroundColor,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
    TextDirection? textDirection,
    bool dismissAll = false,
  }) {
    assert(context != null || OverlayKit.overlayKitContext != null);
    overlay.OverlayToastMessage.show(
      context ?? OverlayKit.overlayKitContext!,
      widget: widget,
      duration: duration ?? const Duration(seconds: 3),
      animDuration: animDuration ?? const Duration(milliseconds: 100),
      textMessage: textMessage,
      decoration: decoration,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      textStyle: textStyle,
      textDirection: textDirection,
      dismissAll: dismissAll,
    );
  }
}

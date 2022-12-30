import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart' as overlay;

import '../../overlay_kit.dart';

class OverlayLoadingProgress {
  OverlayLoadingProgress._();

  static void start({
    BuildContext? context,
    Color? barrierColor = Colors.black54,
    Widget? widget,
    Color color = Colors.black38,
    String? gifOrImagePath,
    bool barrierDismissible = false,
    double? loadingWidth,
  }) {
    assert(context != null || OverlayKit.overlayKitContext != null);
    overlay.OverlayLoadingProgress.start(
      context ?? OverlayKit.overlayKitContext!,
      barrierColor: barrierColor,
      widget: widget,
      color: color,
      gifOrImagePath: gifOrImagePath,
      barrierDismissible: barrierDismissible,
      loadingWidth: loadingWidth,
    );
  }

  static void stop() {
    overlay.OverlayLoadingProgress.stop();
  }
}

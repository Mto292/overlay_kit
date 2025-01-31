import 'package:flutter/cupertino.dart';
import 'package:overlay_kit/src/kit/loading_progress.dart';

extension FutureExtenstion<T> on Future {
  Future<T> callWithProgress({
    BuildContext? context,
    Color? barrierColor,
    Color? circularProgressColor,
    Widget? widget,
    String? gifOrImagePath,
    bool barrierDismissible = false,
    double? loadingWidth,
  }) async {
    try {
      OverlayLoadingProgress.start(
        context: context,
        barrierColor: barrierColor,
        circularProgressColor: circularProgressColor,
        widget: widget,
        gifOrImagePath: gifOrImagePath,
        barrierDismissible: barrierDismissible,
        loadingWidth: loadingWidth,
      );
      final value = await this;
      return value;
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}

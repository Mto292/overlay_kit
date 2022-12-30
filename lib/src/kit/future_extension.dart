import 'package:overlay_kit/src/kit/loading_progress.dart';

extension FutureExtenstion<T> on Future {
  Future<T> callWithProgress() async {
    try {
      OverlayLoadingProgress.start();
      final value = await this;
      return value;
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}

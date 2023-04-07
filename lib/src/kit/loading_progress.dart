import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart' hide Overlay, OverlayEntry, OverlayState;
import '../../overlay_kit.dart';
import '../overlay/overlay.dart';

class OverlayLoadingProgress {
  static OverlayEntry? _overlay;

  static start({
    BuildContext? context,
    Color? barrierColor = Colors.black54,
    Widget? widget,
    Color color = Colors.black38,
    String? gifOrImagePath,
    bool barrierDismissible = false,
    double? loadingWidth,
  }) async {
    assert(context != null || OverlayKit.overlayKitContext != null);

    final ctx = context ?? OverlayKit.overlayKitContext!;

    if (_overlay != null) return;
    _overlay = OverlayEntry(builder: (BuildContext context) {
      return _LoadingWidget(
        color: color,
        barrierColor: barrierColor,
        widget: widget,
        gifOrImagePath: gifOrImagePath,
        barrierDismissible: barrierDismissible,
        loadingWidth: loadingWidth,
      );
    });
    Overlay.of(ctx)!.insert(_overlay!);
  }

  static stop() {
    if (_overlay == null) return;
    _overlay!.remove();
    _overlay = null;
  }
}

class _LoadingWidget extends StatefulWidget {
  final Widget? widget;
  final Color? color;
  final Color? barrierColor;
  final String? gifOrImagePath;
  final bool barrierDismissible;
  final double? loadingWidth;

  const _LoadingWidget({
    Key? key,
    this.widget,
    this.color,
    this.barrierColor,
    this.gifOrImagePath,
    required this.barrierDismissible,
    this.loadingWidth,
  }) : super(key: key);

  @override
  State<_LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<_LoadingWidget> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.barrierDismissible ? OverlayLoadingProgress.stop : null,
      child: Container(
        constraints: const BoxConstraints.expand(),
        color: widget.barrierColor,
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: widget.widget ??
                SizedBox.square(
                  dimension: widget.loadingWidth,
                  child: widget.gifOrImagePath != null
                      ? Image.asset(widget.gifOrImagePath!)
                      : const CircularProgressIndicator(strokeWidth: 3),
                ),
          ),
        ),
      ),
    );
  }
}

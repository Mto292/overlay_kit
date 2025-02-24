import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart' hide Overlay, OverlayEntry, OverlayState;
import 'package:overlay_kit/src/kit/constant.dart';
import '../overlay/overlay.dart';

class OverlayLoadingProgress {
  static OverlayEntry? _overlay;

  static start({
    BuildContext? context,
    Color? barrierColor = Colors.black54,
    Color? circularProgressColor,
    Widget? widget,
    String? gifOrImagePath,
    bool barrierDismissible = false,
    double? loadingWidth,
  }) async {
    assert(context != null || OverlayKitConstant.overlayKitContext != null);

    final ctx = context ?? OverlayKitConstant.overlayKitContext!;

    if (_overlay != null) return;
    _overlay = OverlayEntry(builder: (BuildContext context) {
      return _LoadingWidget(
        barrierColor: barrierColor,
        widget: widget,
        gifOrImagePath: gifOrImagePath,
        barrierDismissible: barrierDismissible,
        loadingWidth: loadingWidth,
        circularProgressColor: circularProgressColor,
      );
    });
    Overlay.of(ctx).insert(_overlay!);
  }

  static stop() {
    if (_overlay == null) return;
    _overlay!.remove();
    _overlay = null;
  }
}

class _LoadingWidget extends StatefulWidget {
  final Widget? widget;
  final Color? barrierColor;
  final Color? circularProgressColor;
  final String? gifOrImagePath;
  final bool barrierDismissible;
  final double? loadingWidth;

  const _LoadingWidget({
    Key? key,
    required this.widget,
    required this.barrierColor,
    required this.gifOrImagePath,
    required this.barrierDismissible,
    required this.loadingWidth,
    required this.circularProgressColor,
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
      child: SizedBox.expand(
        child: GestureDetector(
          onTap: () {},
          child: ColoredBox(
            color: widget.barrierColor ?? Colors.transparent,
            child: Center(
              child: widget.widget ??
                  SizedBox.square(
                    dimension: widget.loadingWidth,
                    child: widget.gifOrImagePath != null
                        ? Image.asset(widget.gifOrImagePath!)
                        : CircularProgressIndicator(
                            strokeWidth: 3,
                            color: widget.circularProgressColor ?? OverlayKitConstant.primaryColor,
                          ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

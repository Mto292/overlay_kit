import 'package:flutter/material.dart' hide Overlay, OverlayEntry, OverlayState;

import 'overlay/overlay.dart';

class OverlayKit extends StatelessWidget {
  final Widget child;

  /// Overlay builder context
  /// you can use it in your overlay
  static BuildContext? overlayKitContext;

  /// The text direction for this subtree.
  final TextDirection textDirection;

  const OverlayKit({
    Key? key,
    required this.child,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Overlay(
        initialEntries: <OverlayEntry>[
          OverlayEntry(
            builder: (BuildContext ctx) {
              overlayKitContext = ctx;
              return child;
            },
          ),
        ],
      ),
    );
  }
}

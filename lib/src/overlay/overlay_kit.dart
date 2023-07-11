import 'package:flutter/material.dart' hide Overlay, OverlayEntry, OverlayState;
import 'package:overlay_kit/src/kit/constant.dart';

import 'overlay.dart';

class OverlayKit extends StatelessWidget {
  final Widget child;

  /// The text direction for this subtree.
  final TextDirection textDirection;

  OverlayKit({
    super.key,
    required this.child,
    this.textDirection = TextDirection.ltr,
    Color? appPrimaryColor,
  }) {
    OverlayKitConstant.primaryColor = appPrimaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Overlay(
        initialEntries: <OverlayEntry>[
          OverlayEntry(
            builder: (BuildContext ctx) {
              OverlayKitConstant.overlayKitContext = ctx;
              return child;
            },
          ),
        ],
      ),
    );
  }
}

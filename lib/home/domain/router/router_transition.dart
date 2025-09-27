import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterTransitions {
  /// Fade Transition
  static PageRouteBuilder buildFade(
    Widget widget, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  /// Scale Transition
  static PageRouteBuilder buildScale(
    Widget widget, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: child,
        );
      },
    );
  }

  /// Slide Transition (any direction)
  static PageRouteBuilder buildSlide(
    Widget widget, {
    Duration duration = const Duration(milliseconds: 500),
    Offset begin = const Offset(1.0, 0.0), // default: from right
    Curve curve = Curves.easeInOut,
  }) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: Offset.zero).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  /// Rotation + Fade
  static PageRouteBuilder buildRotate(
    Widget widget, {
    Duration duration = const Duration(milliseconds: 700),
  }) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(
          turns: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          ),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  /// Combo (Fade + Scale + Slide)
  static PageRouteBuilder buildCombo(
    Widget widget, {
    Duration duration = const Duration(milliseconds: 700),
  }) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var fade = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
        var scale = Tween<double>(begin: 0.9, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        );
        var slide = Tween<Offset>(
          begin: const Offset(0.1, 0.1),
          end: Offset.zero,
        ).animate(animation);

        return FadeTransition(
          opacity: fade,
          child: ScaleTransition(
            scale: scale,
            child: SlideTransition(position: slide, child: child),
          ),
        );
      },
    );
  }

  /// BottomSheet-like (from bottom with ease out)
  static PageRouteBuilder buildBottomSheet(
    Widget widget, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeOutCubic));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  /// Cupertino (iOS style)
  static PageRoute buildCupertino(Widget widget) {
    return CupertinoPageRoute(builder: (context) => widget);
  }

  /// Default Material
  static buildMaterial(
    Widget widget, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
  }) {
    return MaterialPageRoute(
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      allowSnapshotting: allowSnapshotting,
      builder: (context) => widget,
    );
  }
}

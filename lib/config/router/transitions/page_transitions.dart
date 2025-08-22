import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:double_partners/core/domain/enum/transition_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageTransitions extends CustomTransitionPage {
  final Widget screen;
  final TransitionType transitionType;
  final Duration durationTransition;

  PageTransitions({required this.screen, required this.transitionType, this.durationTransition = k150milSec})
    : super(
        child: screen,
        transitionDuration: durationTransition,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return _buildTransition(animation: animation, child: child, transitionType: transitionType);
        },
      );

  static Widget _buildTransition({required Animation<double> animation, required Widget child, required TransitionType transitionType}) {
    switch (transitionType) {
      case TransitionType.fade:
        return _fadeTransition(animation, child);
      case TransitionType.slide:
        return _slideTransition(animation, child);
      case TransitionType.scale:
        return _scaleTransition(animation, child);
      case TransitionType.rotation:
        return _rotationTransition(animation, child);
      case TransitionType.size:
        return _sizeTransition(animation, child);
    }
  }

  static FadeTransition _fadeTransition(Animation<double> animation, Widget child) =>
      FadeTransition(opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOutCirc), child: child);

  static SlideTransition _slideTransition(Animation<double> animation, Widget child) => SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutCirc)),
    child: child,
  );

  static ScaleTransition _scaleTransition(Animation<double> animation, Widget child) => ScaleTransition(
    scale: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutCirc)),
    child: child,
  );

  static RotationTransition _rotationTransition(Animation<double> animation, Widget child) => RotationTransition(
    turns: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutCirc)),
    child: child,
  );

  static SizeTransition _sizeTransition(Animation<double> animation, Widget child) => SizeTransition(
    sizeFactor: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutCirc)),
    child: child,
  );
}

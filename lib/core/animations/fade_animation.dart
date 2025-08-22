import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  const FadeAnimation({super.key, required this.child, required this.duration});

  final Widget child;
  final Duration duration;

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    const double begin = kNone;
    const double end = kSize1;

    _animationController = AnimationController(vsync: this, duration: widget.duration)..forward();

    scaleAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(begin, end, curve: Curves.easeInOut)));

    fadeAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(begin, end, curve: Curves.easeInOut)));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: fadeAnimation, child: ScaleTransition(scale: scaleAnimation, child: widget.child));
  }
}

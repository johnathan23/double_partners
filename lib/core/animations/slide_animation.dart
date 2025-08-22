import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({super.key, required this.child, this.isEven = false});

  final Widget child;
  final bool isEven;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: k500milSec)..forward();

    scaleAnimation = Tween<double>(
      begin: kNone,
      end: kSize1,
    ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(kNone, kSize1, curve: Curves.easeInOut)));

    fadeAnimation = Tween<double>(
      begin: kNone,
      end: kSize1,
    ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(kSize03, kSize1, curve: Curves.easeInOut)));

    slideAnimation = Tween<Offset>(
      begin: widget.isEven ? const Offset(-kSize1, kNone) : const Offset(kSize1, kNone),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(kSize02, kSize1, curve: Curves.easeInOut)));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(position: slideAnimation, child: ScaleTransition(scale: scaleAnimation, child: widget.child)),
    );
  }
}
